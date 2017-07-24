module PeopleHelper

  def member_role(faction, okrug)
    first =  '"' + faction +  '"'
    unless okrug.nil?
      first +  "<br>" + "обрано по округу номер #{okrug}"
    else
      first
    end
  end
  def sort_text
     if params[:sort] == "faction"
        "Фракцією"
     elsif params[:sort] == "distric"
        "Округом"
     elsif params[:sort] == "rebellions"
        "Дотриманням фракційної дисципліни"
     elsif params[:sort] == "attendance"
        "Присутністю"
     else
        "Ім'ям"
     end
  end
  def fraction_to_percentage_display(fraction, options = {precision: 2, significant: true})
    if fraction
      percentage = fraction * 100
      if percentage == 0
        return "0%"
      else
        number_to_percentage(percentage, options)
      end
    else
      'n/a'
    end
  end
  def result_voted(res)
    case res
      when "not_voted"
        '<svg class="svg col" >
        <g>
        <circle cx=50 cy=50 r=25></circle>
                                <g id="002-signs-lenguage-r" transform="translate(43.000000, 35.000000)">
                                    <path d="M14.250566,14.9313208 C14.250566,12.9641509 13.9092075,11.0295094 13.2358491,9.18120755 L12.1079245,6.08498113 L13.1218868,2.60233962 C13.2737358,2.08083019 13.213434,1.53139623 12.952,1.05516981 C12.6906415,0.579018868 12.2594717,0.233132075 11.7378868,0.0813584906 C10.7952453,-0.193283019 9.81116981,0.248603774 9.37041509,1.08528302 C8.96762264,0.974943396 8.54158491,0.991018868 8.14120755,1.13690566 C7.63086792,1.32279245 7.22339623,1.69637736 6.99396226,2.18875472 C6.7645283,2.68113208 6.74060377,3.23335849 6.92649057,3.74369811 L7.83079245,6.22626415 L7.12641509,8.64535849 L7.12641509,8.36460377 C7.12641509,7.24332075 6.21418868,6.33101887 5.09283019,6.33101887 C4.29350943,6.33101887 3.60075472,6.79471698 3.26860377,7.46709434 C2.93441509,7.22618868 2.52483019,7.08362264 2.08226415,7.08362264 C0.960981132,7.08362264 0.0486792453,7.99584906 0.0486792453,9.11713208 L0.0486792453,9.17539623 L0.0486792453,11.1802264 L0.0486792453,14.9313208 C0.0486792453,17.1615094 1.08249057,19.1544906 2.69562264,20.457283 L2.69562264,23.4314717 C2.69562264,23.7232453 2.93215094,23.9597736 3.22392453,23.9597736 L11.0750943,23.9597736 C11.3668679,23.9597736 11.6033962,23.7232453 11.6033962,23.4314717 L11.6033962,20.457283 C13.2167547,19.154566 14.250566,17.1615849 14.250566,14.9313208 Z M10.6993208,1.17743396 C10.9280755,1.05184906 11.192,1.0229434 11.4426415,1.09577358 C11.6931321,1.16875472 11.9003019,1.33486792 12.0258868,1.56362264 C12.1514717,1.79237736 12.1804528,2.05630189 12.1075472,2.30686792 L11.4964528,4.40588679 L10.7480755,2.35154717 C10.6464151,2.0725283 10.4883774,1.82460377 10.2858868,1.61939623 C10.3729057,1.43275472 10.5153208,1.27849057 10.6993208,1.17743396 Z M7.95169811,2.63501887 C8.06188679,2.39849057 8.25766038,2.21901887 8.50286792,2.12973585 C8.748,2.04037736 9.01343396,2.05192453 9.24988679,2.16211321 C9.48641509,2.27230189 9.66588679,2.46807547 9.75516981,2.71328302 L12.2430189,9.54286792 C12.5672453,10.4329057 12.8086792,11.3444528 12.9674717,12.2704151 L10.8513208,11.5166792 C10.8503396,11.4595472 10.8405283,11.4015849 10.8198491,11.3449057 L7.91932075,3.38203774 C7.82996226,3.13683019 7.84150943,2.87154717 7.95169811,2.63501887 Z M9.59501887,11.0691321 L7.96784906,10.4895849 C7.8829434,10.4593208 7.79728302,10.4353962 7.71139623,10.4162264 L8.44249057,7.90528302 L9.59501887,11.0691321 Z M4.116,8.3645283 C4.116,7.82581132 4.55426415,7.38754717 5.09298113,7.38754717 C5.63169811,7.38754717 6.06996226,7.82581132 6.06996226,8.3645283 L6.06996226,10.7071698 C5.67735849,10.9576604 5.36173585,11.3348679 5.19373585,11.806566 C5.15267925,11.9217358 5.12226415,12.0389434 5.10113208,12.1569057 C5.09841509,12.1569057 5.09577358,12.157283 5.0930566,12.157283 C4.55433962,12.157283 4.11607547,11.7190189 4.11607547,11.1803019 L4.11607547,9.11720755 L4.11607547,8.3645283 L4.116,8.3645283 Z M1.10543396,9.11713208 C1.10543396,8.57841509 1.54369811,8.14022642 2.08241509,8.14022642 C2.62113208,8.14022642 3.05939623,8.57849057 3.05939623,9.11713208 L3.05939623,11.1802264 C3.05939623,11.7189434 2.62113208,12.1572075 2.08241509,12.1572075 C1.54369811,12.1572075 1.10543396,11.7189434 1.10543396,11.1802264 L1.10543396,9.17539623 L1.10543396,9.11713208 L1.10543396,9.11713208 Z M1.10543396,14.9313208 L1.10543396,12.9630943 C1.39554717,13.122717 1.7285283,13.2137358 2.08241509,13.2137358 C2.67841509,13.2137358 3.21539623,12.956 3.58769811,12.5461132 C3.96,12.956 4.49690566,13.2137358 5.09298113,13.2137358 C5.12075472,13.2137358 5.14815094,13.2113208 5.17577358,13.2102642 C5.20430189,13.2969057 5.23788679,13.3824906 5.27766038,13.4662642 C5.52641509,13.9902642 5.96430189,14.3859623 6.51064151,14.5806038 L9.73939623,15.7306415 C9.79796226,15.7514717 9.85781132,15.761434 9.91667925,15.761434 C10.1338113,15.761434 10.3373585,15.6264906 10.4143396,15.4102642 C10.5122264,15.1353962 10.3687547,14.8332075 10.0938868,14.7353208 L6.86520755,13.585283 C6.58467925,13.4853585 6.35984906,13.2821887 6.23215094,13.0131321 C6.16860377,12.8792453 6.13298113,12.7369811 6.12543396,12.593283 C6.12535849,12.5867925 6.12550943,12.5803774 6.12520755,12.5738868 C6.12037736,12.4352453 6.1410566,12.2955472 6.1890566,12.1609811 C6.39532075,11.5818868 7.03426415,11.278566 7.61335849,11.4848302 L13.1235472,13.4474717 C13.1698868,13.9392453 13.1939623,14.4340377 13.1939623,14.9312453 C13.1939623,18.2640755 10.4824906,20.9754717 7.14973585,20.9754717 C3.81698113,20.9754717 1.10543396,18.2641509 1.10543396,14.9313208 Z M10.5470189,22.9031698 L3.75245283,22.9031698 L3.75245283,21.165283 C4.76218868,21.7177358 5.91992453,22.0322264 7.14973585,22.0322264 C8.37954717,22.0322264 9.53728302,21.7178113 10.5470189,21.165283 L10.5470189,22.9031698 L10.5470189,22.9031698 Z" id="Shape"></path>
        </g>
                            </g>
        </svg><p class="text-xs-center">'.html_safe +
        + "не голосував" +'</p>'.html_safe
      when "absent"
         '<svg class="svg col"><circle cx="50" cy="50" r="25"></circle></svg><p class="text-xs-center">'.html_safe +
        + "відсутній" +'</p>'.html_safe
      when "against"
        '<svg class="svg col" >
        <g>
        <circle cx=50 cy=50 r=25></circle>
                                <g transform="translate(34.062731, 29.000000) scale(1, -1) translate(-31.062731, -33.000000) translate(35.000000, 0.000000)">
                                    <path d="M25.4641771,8.21251661 L21.1662288,8.21251661 L10.6761919,0.573166052 C9.52056089,-0.3099631 7.86163838,-0.0918376384 6.9738155,1.0616679 C6.96371956,1.07477491 6.95406642,1.08841328 6.94512177,1.10231734 C6.55678229,1.70090037 6.44758672,2.38432472 6.62063469,3.13363838 C7.09602952,5.1921476 9.76746863,7.41183764 11.5921771,8.72112177 L9.78562362,8.72112177 C9.74178598,8.72112177 9.69901107,8.7258155 9.65783026,8.73449446 C9.5755572,8.7258155 9.49213284,8.72112177 9.40764576,8.72112177 L2.3658155,8.72112177 C1.06122509,8.72103321 0,9.78234686 0,11.0868487 C0,11.9420812 0.456177122,12.6928118 1.13800738,13.108428 C0.816531365,13.5125314 0.623734317,14.0233506 0.623734317,14.5786273 C0.623734317,15.579631 1.24897417,16.4368118 2.12918081,16.7817565 C1.88723247,17.1528266 1.7458893,17.5952768 1.7458893,18.0704059 C1.7458893,19.051572 2.3463321,19.8949373 3.19890775,20.2529004 C2.94863469,20.6281328 2.8023321,21.0783764 2.8023321,21.5621845 C2.8023321,22.8666863 3.8635572,23.928 5.1681476,23.928 L8.26184502,23.928 L8.2621107,23.928 L8.50361624,23.928 C8.50503321,23.928 8.50645018,23.9279114 8.50795572,23.9279114 L16.0560886,23.9245461 C16.0619336,23.9245461 16.0678672,23.9244576 16.0738007,23.9242804 C18.8429225,23.8441328 21.199262,22.7958376 22.6494465,21.0237343 L25.4642657,21.0237343 C25.8066421,21.0237343 26.0841919,20.7461845 26.0841919,20.4038081 L26.0841919,8.8324428 C26.0841033,8.48997786 25.8065535,8.21251661 25.4641771,8.21251661 Z M2.3658155,9.96088561 L9.4075572,9.96088561 C10.0284576,9.96088561 10.5335203,10.4660369 10.5335203,11.0868487 C10.5335203,11.7076605 10.0284576,12.2128118 9.4075572,12.2128118 L2.98954982,12.2128118 L2.3658155,12.2128118 C1.74491513,12.2128118 1.2398524,11.7076605 1.2398524,11.0868487 C1.2398524,10.4660369 1.74491513,9.96088561 2.3658155,9.96088561 Z M2.98954982,13.4526642 L9.4075572,13.4526642 C10.0284576,13.4526642 10.5335203,13.9578155 10.5335203,14.5786273 C10.5335203,15.1994391 10.0284576,15.7045904 9.4075572,15.7045904 L4.1117048,15.7045904 L2.98954982,15.7045904 C2.36864945,15.7045904 1.86358672,15.1994391 1.86358672,14.5786273 C1.86358672,13.9578155 2.36864945,13.4526642 2.98954982,13.4526642 Z M4.1117048,16.9443542 L9.4075572,16.9443542 C10.0284576,16.9443542 10.5335203,17.4495055 10.5335203,18.0703173 C10.5335203,18.6911292 10.0284576,19.1962804 9.4075572,19.1962804 L8.50361624,19.1962804 L5.1681476,19.1962804 L4.11161624,19.1962804 C3.49071587,19.1962804 2.98565314,18.6911292 2.98565314,18.0703173 C2.98565314,17.4495055 3.49080443,16.9443542 4.1117048,16.9443542 Z M4.04227306,21.5620959 C4.04227306,20.9412841 4.54733579,20.4361328 5.16823616,20.4361328 L8.50361624,20.4361328 C9.12451661,20.4361328 9.62957934,20.9412841 9.62957934,21.5620959 C9.62957934,22.1821993 9.1256679,22.6867306 8.5057417,22.6879705 L8.26157934,22.688059 L5.1681476,22.688059 C4.54733579,22.688059 4.04227306,22.1829077 4.04227306,21.5620959 Z M16.046524,22.6846052 L10.5843542,22.6869963 C10.7660812,22.3522362 10.8693432,21.9690332 10.8693432,21.5620959 C10.8693432,21.0553506 10.7086937,20.5858007 10.436369,20.2003838 C11.226952,19.8170037 11.7732841,19.0063173 11.7732841,18.0703173 C11.7732841,17.3797196 11.4757196,16.7573137 11.0021845,16.324428 C11.4757196,15.8915424 11.7732841,15.2691365 11.7732841,14.5785387 C11.7732841,13.887941 11.4757196,13.2655351 11.0021845,12.8326494 C11.4757196,12.3997638 11.7732841,11.7773579 11.7732841,11.0867601 C11.7732841,10.6793801 11.669845,10.2958229 11.4877638,9.96079705 L13.050952,9.96079705 C13.109048,10.5679705 13.2725314,11.5561328 13.7276458,12.7028192 C14.4065535,14.4136384 15.8933137,16.8277196 19.1210923,18.6126642 C19.2162066,18.6652694 19.3190258,18.6902435 19.4206052,18.6902435 C19.6388192,18.6902435 19.8504797,18.5746716 19.9636605,18.3701845 C20.1293579,18.070583 20.0207823,17.6933137 19.7211808,17.5277048 C17.4076162,16.2482657 15.7860664,14.4890923 14.9016089,12.2991587 C14.2394391,10.6597196 14.2590996,9.37470111 14.2595424,9.35681181 C14.2598967,9.34228782 14.2590996,9.32811808 14.2584797,9.31385978 C14.2583026,9.3095203 14.2584797,9.30509225 14.2581255,9.30075277 C14.2562657,9.27081919 14.2518376,9.24150554 14.2458155,9.21281181 C14.2447528,9.2078524 14.2436015,9.20307011 14.2424502,9.19819926 C14.2354539,9.1684428 14.2267749,9.13930627 14.2156162,9.11132103 C14.2156162,9.11114391 14.2155277,9.11105535 14.2154391,9.11087823 C14.2041919,9.08280443 14.1905535,9.05597048 14.1754982,9.0301107 C14.1731956,9.02612546 14.1710701,9.02214022 14.168679,9.01815498 C14.1535351,8.99344649 14.1367085,8.96997786 14.1183764,8.94766052 C14.1146568,8.94305535 14.1106716,8.93862731 14.1067749,8.9341107 C14.0872915,8.91179336 14.0666568,8.89053875 14.0442509,8.87114391 C14.0423026,8.86946125 14.0401771,8.86804428 14.0382288,8.86636162 C14.0147601,8.84661255 13.9898745,8.82872325 13.963572,8.81269373 C13.9619779,8.81171956 13.960738,8.8104797 13.9591439,8.80950554 C13.9565756,8.80791144 13.9537417,8.80622878 13.9511734,8.80463469 C13.9507306,8.80445756 13.9503764,8.80419188 13.9499336,8.8039262 C12.407203,7.87474539 8.32693727,5.01183764 7.82869373,2.8544059 C7.73499631,2.44879705 7.78184502,2.10287823 7.97180812,1.7979631 C8.44808856,1.20123985 9.31988192,1.09363838 9.92696679,1.56097417 C9.93139483,1.56433948 9.93573432,1.56761624 9.9400738,1.57080443 L20.3535055,9.15436162 L22.3926199,14.4531365 C23.1439705,16.4055498 23.0086494,18.3059779 22.0113653,19.8043395 C20.8451956,21.5569594 18.6713801,22.6064059 16.046524,22.6846052 Z M24.8442509,19.7837934 L23.4523395,19.7837934 C24.2980074,18.0758967 24.3379483,16.0557343 23.5499336,14.0080295 L21.7967823,9.452369 L24.8443395,9.452369 L24.8443395,19.7837934 L24.8442509,19.7837934 Z" id="Shape"></path>
        </g>
                            </g>
        </svg><p class="text-xs-center">'.html_safe +
         + "проти"
      when "aye"
        '<svg class="svg col" >
        <g>
        <circle cx=50 cy=50 r=25></circle>
                                <g transform="translate(35.000000, 35.000000)">
                                    <path d="M25.4641771,8.21251661 L21.1662288,8.21251661 L10.6761919,0.573166052 C9.52056089,-0.3099631 7.86163838,-0.0918376384 6.9738155,1.0616679 C6.96371956,1.07477491 6.95406642,1.08841328 6.94512177,1.10231734 C6.55678229,1.70090037 6.44758672,2.38432472 6.62063469,3.13363838 C7.09602952,5.1921476 9.76746863,7.41183764 11.5921771,8.72112177 L9.78562362,8.72112177 C9.74178598,8.72112177 9.69901107,8.7258155 9.65783026,8.73449446 C9.5755572,8.7258155 9.49213284,8.72112177 9.40764576,8.72112177 L2.3658155,8.72112177 C1.06122509,8.72103321 0,9.78234686 0,11.0868487 C0,11.9420812 0.456177122,12.6928118 1.13800738,13.108428 C0.816531365,13.5125314 0.623734317,14.0233506 0.623734317,14.5786273 C0.623734317,15.579631 1.24897417,16.4368118 2.12918081,16.7817565 C1.88723247,17.1528266 1.7458893,17.5952768 1.7458893,18.0704059 C1.7458893,19.051572 2.3463321,19.8949373 3.19890775,20.2529004 C2.94863469,20.6281328 2.8023321,21.0783764 2.8023321,21.5621845 C2.8023321,22.8666863 3.8635572,23.928 5.1681476,23.928 L8.26184502,23.928 L8.2621107,23.928 L8.50361624,23.928 C8.50503321,23.928 8.50645018,23.9279114 8.50795572,23.9279114 L16.0560886,23.9245461 C16.0619336,23.9245461 16.0678672,23.9244576 16.0738007,23.9242804 C18.8429225,23.8441328 21.199262,22.7958376 22.6494465,21.0237343 L25.4642657,21.0237343 C25.8066421,21.0237343 26.0841919,20.7461845 26.0841919,20.4038081 L26.0841919,8.8324428 C26.0841033,8.48997786 25.8065535,8.21251661 25.4641771,8.21251661 Z M2.3658155,9.96088561 L9.4075572,9.96088561 C10.0284576,9.96088561 10.5335203,10.4660369 10.5335203,11.0868487 C10.5335203,11.7076605 10.0284576,12.2128118 9.4075572,12.2128118 L2.98954982,12.2128118 L2.3658155,12.2128118 C1.74491513,12.2128118 1.2398524,11.7076605 1.2398524,11.0868487 C1.2398524,10.4660369 1.74491513,9.96088561 2.3658155,9.96088561 Z M2.98954982,13.4526642 L9.4075572,13.4526642 C10.0284576,13.4526642 10.5335203,13.9578155 10.5335203,14.5786273 C10.5335203,15.1994391 10.0284576,15.7045904 9.4075572,15.7045904 L4.1117048,15.7045904 L2.98954982,15.7045904 C2.36864945,15.7045904 1.86358672,15.1994391 1.86358672,14.5786273 C1.86358672,13.9578155 2.36864945,13.4526642 2.98954982,13.4526642 Z M4.1117048,16.9443542 L9.4075572,16.9443542 C10.0284576,16.9443542 10.5335203,17.4495055 10.5335203,18.0703173 C10.5335203,18.6911292 10.0284576,19.1962804 9.4075572,19.1962804 L8.50361624,19.1962804 L5.1681476,19.1962804 L4.11161624,19.1962804 C3.49071587,19.1962804 2.98565314,18.6911292 2.98565314,18.0703173 C2.98565314,17.4495055 3.49080443,16.9443542 4.1117048,16.9443542 Z M4.04227306,21.5620959 C4.04227306,20.9412841 4.54733579,20.4361328 5.16823616,20.4361328 L8.50361624,20.4361328 C9.12451661,20.4361328 9.62957934,20.9412841 9.62957934,21.5620959 C9.62957934,22.1821993 9.1256679,22.6867306 8.5057417,22.6879705 L8.26157934,22.688059 L5.1681476,22.688059 C4.54733579,22.688059 4.04227306,22.1829077 4.04227306,21.5620959 Z M16.046524,22.6846052 L10.5843542,22.6869963 C10.7660812,22.3522362 10.8693432,21.9690332 10.8693432,21.5620959 C10.8693432,21.0553506 10.7086937,20.5858007 10.436369,20.2003838 C11.226952,19.8170037 11.7732841,19.0063173 11.7732841,18.0703173 C11.7732841,17.3797196 11.4757196,16.7573137 11.0021845,16.324428 C11.4757196,15.8915424 11.7732841,15.2691365 11.7732841,14.5785387 C11.7732841,13.887941 11.4757196,13.2655351 11.0021845,12.8326494 C11.4757196,12.3997638 11.7732841,11.7773579 11.7732841,11.0867601 C11.7732841,10.6793801 11.669845,10.2958229 11.4877638,9.96079705 L13.050952,9.96079705 C13.109048,10.5679705 13.2725314,11.5561328 13.7276458,12.7028192 C14.4065535,14.4136384 15.8933137,16.8277196 19.1210923,18.6126642 C19.2162066,18.6652694 19.3190258,18.6902435 19.4206052,18.6902435 C19.6388192,18.6902435 19.8504797,18.5746716 19.9636605,18.3701845 C20.1293579,18.070583 20.0207823,17.6933137 19.7211808,17.5277048 C17.4076162,16.2482657 15.7860664,14.4890923 14.9016089,12.2991587 C14.2394391,10.6597196 14.2590996,9.37470111 14.2595424,9.35681181 C14.2598967,9.34228782 14.2590996,9.32811808 14.2584797,9.31385978 C14.2583026,9.3095203 14.2584797,9.30509225 14.2581255,9.30075277 C14.2562657,9.27081919 14.2518376,9.24150554 14.2458155,9.21281181 C14.2447528,9.2078524 14.2436015,9.20307011 14.2424502,9.19819926 C14.2354539,9.1684428 14.2267749,9.13930627 14.2156162,9.11132103 C14.2156162,9.11114391 14.2155277,9.11105535 14.2154391,9.11087823 C14.2041919,9.08280443 14.1905535,9.05597048 14.1754982,9.0301107 C14.1731956,9.02612546 14.1710701,9.02214022 14.168679,9.01815498 C14.1535351,8.99344649 14.1367085,8.96997786 14.1183764,8.94766052 C14.1146568,8.94305535 14.1106716,8.93862731 14.1067749,8.9341107 C14.0872915,8.91179336 14.0666568,8.89053875 14.0442509,8.87114391 C14.0423026,8.86946125 14.0401771,8.86804428 14.0382288,8.86636162 C14.0147601,8.84661255 13.9898745,8.82872325 13.963572,8.81269373 C13.9619779,8.81171956 13.960738,8.8104797 13.9591439,8.80950554 C13.9565756,8.80791144 13.9537417,8.80622878 13.9511734,8.80463469 C13.9507306,8.80445756 13.9503764,8.80419188 13.9499336,8.8039262 C12.407203,7.87474539 8.32693727,5.01183764 7.82869373,2.8544059 C7.73499631,2.44879705 7.78184502,2.10287823 7.97180812,1.7979631 C8.44808856,1.20123985 9.31988192,1.09363838 9.92696679,1.56097417 C9.93139483,1.56433948 9.93573432,1.56761624 9.9400738,1.57080443 L20.3535055,9.15436162 L22.3926199,14.4531365 C23.1439705,16.4055498 23.0086494,18.3059779 22.0113653,19.8043395 C20.8451956,21.5569594 18.6713801,22.6064059 16.046524,22.6846052 Z M24.8442509,19.7837934 L23.4523395,19.7837934 C24.2980074,18.0758967 24.3379483,16.0557343 23.5499336,14.0080295 L21.7967823,9.452369 L24.8443395,9.452369 L24.8443395,19.7837934 L24.8442509,19.7837934 Z" id="Shape"></path>
        </g>
                            </g>
        </svg><p  class="text-xs-center">'.html_safe +
        + "за" +'</p>'.html_safe
      when "abstain"
        '<svg class="svg col" >
                            <g>
                                <circle cx=50 cy=50 r=25></circle>
                                <g id="001-present" transform="translate(43.000000, 35.000000)">
                                    <path d="M11.767425,0 C10.5951,0 9.6414,0.953775 9.6414,2.1261 L9.6414,6.057825 C9.3255,5.8716 8.957775,5.764275 8.5653,5.764275 C7.9272,5.764275 7.35435,6.04725 6.964275,6.4938 C6.574275,6.04725 6.00135,5.764275 5.36325,5.764275 C4.72515,5.764275 4.152225,6.04725 3.762225,6.4938 C3.372225,6.04725 2.7993,5.764275 2.1612,5.764275 C0.988875,5.764275 0.0351,6.717975 0.0351,7.8903 L0.0351,10.26285 C0.0351,10.294575 0.03615,10.32615 0.0375,10.3575 C0.036075,10.373175 0.0351,10.389075 0.0351,10.405125 L0.0351,15.19755 C0.0351,17.367 1.03755,19.306425 2.60325,20.5779 L2.60325,23.45355 C2.60325,23.7435 2.8383,23.97855 3.12825,23.97855 L10.8003,23.97855 C11.09025,23.97855 11.3253,23.7435 11.3253,23.45355 L11.3253,20.5779 C12.891,19.306425 13.89345,17.366925 13.89345,15.197475 L13.89345,2.1261 C13.893525,0.953775 12.93975,0 11.767425,0 Z M10.691475,2.1261 C10.691475,1.532775 11.174175,1.05 11.7675,1.05 C12.360825,1.05 12.8436,1.532775 12.8436,2.1261 L12.8436,12.668925 L10.518375,11.8407 C10.630875,11.577675 10.69155,11.2929 10.69155,11.00415 L10.69155,8.0346 L10.69155,7.8903 L10.69155,2.1261 L10.691475,2.1261 Z M8.565375,6.814275 C9.1587,6.814275 9.641475,7.296975 9.641475,7.8903 L9.641475,8.0346 L9.641475,11.00415 C9.641475,11.1753 9.601575,11.338875 9.526425,11.487375 L7.7649,10.859925 C7.6737,10.82745 7.5816,10.802175 7.48935,10.78275 L7.48935,7.8903 C7.48935,7.296975 7.97205,6.814275 8.565375,6.814275 Z M5.363325,6.814275 C5.95665,6.814275 6.439425,7.296975 6.439425,7.8903 L6.439425,10.827975 C5.84865,11.00655 5.342025,11.438475 5.0898,12.04365 C4.628775,11.92215 4.2873,11.502825 4.2873,11.004225 L4.2873,10.262925 L4.2873,7.890375 C4.287225,7.296975 4.77,6.814275 5.363325,6.814275 Z M1.085175,7.8903 C1.085175,7.296975 1.56795,6.814275 2.161275,6.814275 C2.7546,6.814275 3.2373,7.296975 3.2373,7.8903 L3.2373,10.26285 C3.2373,10.856175 2.7546,11.33895 2.161275,11.33895 C1.56795,11.33895 1.085175,10.856175 1.085175,10.26285 L1.085175,7.8903 Z M10.275375,22.9287 L3.653325,22.9287 L3.653325,21.2832 C4.6377,21.820875 5.765925,22.126875 6.96435,22.126875 C8.162775,22.126875 9.291,21.82095 10.2753,21.283275 L10.2753,22.9287 L10.275375,22.9287 Z M6.964275,21.0768 C3.722475,21.0768 1.0851,18.439425 1.0851,15.197625 L1.0851,12.0954 C1.401,12.281625 1.768725,12.38895 2.1612,12.38895 C2.649075,12.38895 3.0987,12.22335 3.45795,11.946 C3.745125,12.52455 4.287675,12.95475 4.937625,13.08735 C5.02245,13.873875 5.544525,14.58285 6.33825,14.8656 L9.4842,15.986175 C9.5424,16.006875 9.601875,16.016775 9.660375,16.016775 C9.87615,16.016775 10.07835,15.882675 10.154925,15.6678 C10.252275,15.39465 10.109625,15.09435 9.83655,14.997075 L6.6906,13.8765 C6.1317,13.677375 5.8389,13.060725 6.03795,12.50175 C6.237,11.942775 6.853725,11.65005 7.4127,11.849175 L12.8436,13.783575 L12.8436,15.1977 C12.843525,18.439425 10.20615,21.0768 6.964275,21.0768 Z" id="Shape"></path>
                                </g>
                            </g>
                        </svg><p class="text-xs-center">'.html_safe +
       + "утримався" +'</p>'.html_safe
    end
  end
end
