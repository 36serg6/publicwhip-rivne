# frozen_string_literal: true

namespace :load_division do
  desc 'Load votes'
  task :votes, %i[from_date to_date] => :environment do |_t, _args|
    start_time = Time.now
    load_votes = JSON.load(open(Settings.source_data_url_votes_events))
    save_votes = Division.pluck(:date).uniq.to_a.map { |d| d.strftime('%Y-%m-%d') }
    date_votes = load_votes - save_votes
    date_votes.each do |date|
      p "date_votes: " + date
      divisions = JSON.load(open("#{Settings.source_data_url_votes_event_details}#{date}.json"))
      divisions.each do |d|
        p d[0]['date_vote'] + " #" + d[0]['number']
        date_vote = DateTime.parse(d[0]['date_vote']).strftime('%F')
        mps = Mp.where('? >= start_date and end_date >= ?', date, date).to_a.uniq(&:deputy_id)
        if d[0]['option']=="Прийнятий"
          option = "Прийнято"
        else
          option = "Не прийнято"  
        end    
        
        division = Division.find_or_create_by(
          date: date_vote,
          number: d[0]['number'],
          name: d[0]['name'],
          clock_time: DateTime.parse(d[0]['date_vote']).strftime('%T'),
          result: option
        )
        division.votes.destroy_all
        d[1]['votes'].each do |v|
          mp = mps.find { |m| m['deputy_id'] == v['voter_id'].to_i }.id
          division.votes.create(deputy_id: mp, vote: v['result'])
        end
      end
    end
    p "---> load_division:votes total time: " + Time.at(Time.now - start_time).utc.strftime("%H:%M:%S")
  end
end
