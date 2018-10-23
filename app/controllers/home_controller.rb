class HomeController < ApplicationController
  def index
    @mps = Mp.order(last_name: :asc).map{|m| m.last_name + " " + m.first_name + " " + m.middle_name}
    @last_division = Division.includes(:division_info).order(date: :asc).last(4)
    @top_mp_rebellions = Mp.includes(:mp_info).where(end_date: '9999-12-31').where('mp_infos.date_mp_info =  ?','9999-12-31').references(:mp_info).to_a.sort_by{ |m| [-(m.mp_info.attendance_fraction || -1), m.last_name, m.first_name, m.middle_name, m.faction, m.okrug ]}.reverse[0 .. 3]
    respond_to do |format|
      format.html
      format.js
    end
  end
  def search_mp
    mps = Mp.find_by_search_query params[:mp]
    unless mps[0].blank?
      mp = mps[0].full_name.gsub(" ", "_")
      redirect_to show_people_path(mp)
    else
      redirect_to errors_not_found_path, :status => '404'
    end
  end
  def search
    unless params[:query].blank?
      @mps = Mp.find_by_search_query params[:query]
      @divisions = Division.find_by_search_query params[:query]
    end

    respond_to do |format|
      format.js
    end
  end
end
