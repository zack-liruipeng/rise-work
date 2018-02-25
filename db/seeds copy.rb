# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html

#############################################
#Setup Study info
#############################################

puts 'DEFAULT STATUSES'

status = Status.find_or_create_by_name({ :name => 'NOTSTARTED' }, :without_protection => true)
puts 'status:' << status.name

status = Status.find_or_create_by_name({ :name => 'STARTING' }, :without_protection => true)
puts 'status:' << status.name

status = Status.find_or_create_by_name({ :name => 'INPROGRESS' }, :without_protection => true)
puts 'status:' << status.name

status = Status.find_or_create_by_name({ :name => 'FINISHED' }, :without_protection => true)
puts 'status:' << status.name

study = Study.find_or_create_by_name({ :name => 'RiseAtWork',:duration_in_days => '84'}, :without_protection => true)
puts 'study:' << study.name

phase = Phase.find_or_create_by_name({ :name => 'Baseline',:order_id => '1',:duration_in_days => '14',:start_on_day_of_study => "1", :finish_on_day_of_study=>"14", :daily_phase_goal => '0', :daily_phase_goal=>'0'}, :without_protection => true)
puts 'phase:' << phase.name
study.phases << phase
phase.description = '<p>In this first week, you will be collecting baseline data about how many steps you usually take each day and over a week. Don&#39t change your usual routine.  This information will then be used to provide you with individualized goals to ramp up your steps over the next ten weeks. </p><p> Check in once a day to log your steps. Find a time that works best for you so you can get in the habit of monitoring your daily steps.  For example, you could enter the previous day&#39s steps first thing when you get to work. Or you could enter your daily steps before you shut down your computer at the end of the day.</p><p> If you miss a day or two make a note of your steps and you can still enter these within three days.</p>'
phase.study = study
phase.save
study.save

 #phase.study << study


phase2 = Phase.find_or_create_by_name({ :name => 'Phase 1',:order_id => '2',:duration_in_days => '14',:start_on_day_of_study => "15", :finish_on_day_of_study=>"29", :daily_phase_goal => '1000', :daily_phase_goal=>'14000'}, :without_protection => true)
puts 'phase:' << phase2.name

phase2.description = '<p>During this first phase of RISE@Work, try to sit less and move more whenever you can in your daily working tasks. Sitting for long periods of time can be unhealthy. In fact, if you are sitting less often and moving frequently throughout the day, you can use more energy than someone who goes to the gym but spends their whole workday seated.</p> 
<p>This phase encourages you to make small but important changes at the beginning of your program.</p>
<p>Your aim is to add 1000 steps/day to your baseline step count. Use your pedometer and the dashboard feature of this website to monitor your progress towards this target.</p>
<p>Please access your <b>support strategies</b> for tips on how to achieve your target in this phase. Download the Take a Stand app from the bottom of the dashboard.</p>'


study.phases<<phase2
phase2.study = study
phase2.save
study.save

 phase3 = Phase.find_or_create_by_name({ :name => 'Phase 2',:order_id => '3',:duration_in_days => '14',:start_on_day_of_study => "30", :finish_on_day_of_study=>"44", :daily_phase_goal => '2000', :daily_phase_goal=>'28000'}, :without_protection => true)
puts 'phase:' << phase3.name
phase3.description = '<p>During this second phase of RISE@Work, incorporate shorter planned walks into your daily routine. This will bring additional health and work-related benefits on top of those you have already gained from reducing the time you spend sitting each day. Shorter planned walks last for about 10 minutes and make you breathe a little harder and feel slightly warmer. </p>
<p>This phase builds on the changes you have already made to your workday and encourages you to make additional increases to your daily steps.</p>
<p>Using a combination of the new planning tool and maps tool, your step target is to now add 2000 steps/day onto your baseline step count. Use your pedometer and the dashboard feature of this website to monitor your progress towards this target.</p>
<p><p>Each ten minutes spent walking counts towards your step target and your health.</p>'
 study.phases << phase3
 phase3.study = study
 phase3.save
 study.save

 phase4 = Phase.find_or_create_by_name({ :name => 'Phase 3',:order_id => '4',:duration_in_days => '14',:start_on_day_of_study => "45", :finish_on_day_of_study=>"59", :daily_phase_goal => '3000', :daily_phase_goal=>'42000'}, :without_protection => true)
puts 'phase:' << phase4.name

 study.phases << phase4
 phase4.description = '<p>This third phase of RISE@Work challenges you to increase your step counts through a combination of walking in daily tasks and taking longer planned walks.</p>
<p>Try to make additional increases to your daily steps through extending your short walk from 10 to 20 minutes. Once again, these walks should make you breathe harder and feel warmer, but you should still be able to walk and talk comfortably.</p>
<p>Using a combination of strategies, your aim is to now add 3000 steps/day onto your baseline step count. Use your pedometer and the website dashboard to monitor your progress towards this target.</p>
<p>It is not always easy to include a 20-minute walk into each workday. Try your best to plan ahead for longer walks whenever you can by using the action planning tool to develop strategies to overcome barriers that you may encounter.</p>'
 phase4.study = study
 phase4.save
 study.save

 phase5 = Phase.find_or_create_by_name({ :name => 'Phase 4',:order_id => '5',:duration_in_days => '14',:start_on_day_of_study => "60", :finish_on_day_of_study=>"74", :daily_phase_goal => '3000', :daily_phase_goal=>'42000'}, :without_protection => true)
puts 'phase:' << phase5.name
phase5.description = '<p>You are in Phase 4.  My target is to maintain 3000 steps/day over baseline but I am challenging myself to increase my walking by as many steps. I can do this through a combination of breaking up my sitting time and taking planned walks.  Please review all your support strategies.</p>'
 study.phases << phase5
 phase5.study = study
 phase5.save
 study.save

 phase6 = Phase.find_or_create_by_name({ :name => 'Phase 5',:order_id => '6',:duration_in_days => '14',:start_on_day_of_study => "75", :finish_on_day_of_study=>"89", :daily_phase_goal => '3000', :daily_phase_goal=>'42000'}, :without_protection => true)
puts 'phase:' << phase6.name

#study.phases = (phase,phase2,phase3,phase4,phase5,phase6)
phase6.description = '<p>You are in Phase 5.  My target is to maintain 3000 steps/day over baseline but I am challenging myself to increase my walking by as many steps. I can do this through a combination of breaking up my sitting time and taking planned walks.  Please review all your support strategies.</p>'
 study.phases << phase6
 phase6.study = study
 phase6.save
 study.save


#############################################
#Setup Default Users
#############################################

puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.confirm!
user.add_role :admin

#############################################
#Setup Strategies
#############################################


#############################################
#Strategies Phase 1
#############################################

strategy = Strategy.find_or_create_by_name({:name => 'Park it',:content=>'
<div class="row-fluid">
<div class="span6"> 
<p>Gain steps before you even start work. If it is an option, try parking further away from your office and walking the extra distance.</p>
</div>
<div class="span6">
 <table id="datatable_example" class="responsive table table-striped table-bordered" style="width:100%;margin-bottom:0; ">
  <thead> <tr> <th class="">Key benefits:</th> </tr> </thead> 
  <tbody> <tr> <td>200-1000 steps gained</td> </tr> 
  <tr> <td>Time to think and relax before and after work</td> </tr> 
  <tr> <td> Pay less for parking</td> </tr>
  </tbody> 
  </table>
  </div>
  </div>'

} )
strategy.strategy_type = 'support'
strategy.phase = phase2
phase2.strategies << strategy

puts 'Strategy:' << strategy.name

strategy2 = Strategy.find_or_create_by_name({:name => 'Active emails',:content=>'
<div class="row-fluid">
<div class="span6"> 
<p>If someone is in the same building as you and it is convenient, take a walk to deliver the message in person.</p>
</div>
<div class="span6">
 <table id="datatable_example" class="responsive table table-striped table-bordered" style="width:100%;margin-bottom:0; ">
  <thead> <tr> <th class="">Key benefits:</th> </tr> </thead> 
  <tbody> <tr> <td>500-1000 steps gained</td> </tr> 
  <tr> <td>Interacting with colleagues</td> </tr> 
  </tbody> 
  </table>
  </div>
  </div>'
  } )

strategy2.strategy_type = 'support'
strategy2.phase = phase2
phase2.strategies << strategy2

puts 'Strategy:' << strategy2.name


strategy3 = Strategy.find_or_create_by_name({:name => 'Onwards and upwards',:content=>'
<div class="row-fluid">
<div class="span6"> 
<p>If you have the option, rather than taking the lift or the elevator, choose to take the stairs for a couple of floors.</p>
</div>
<div class="span6">
 <table id="datatable_example" class="responsive table table-striped table-bordered" style="width:100%;margin-bottom:0; ">
  <thead> <tr> <th class="">Key benefits:</th> </tr> </thead> 
  <tbody> <tr> <td>50-250 steps gained</td> </tr> 
  <tr> <td>Increases in walking intensity</td> </tr> 
  </tbody> 
  </table>
  </div>
  </div>'
} )

strategy3.strategy_type = 'support'
strategy3.phase = phase2
phase2.strategies << strategy3

puts 'Strategy:' << strategy3.name


strategy4 = Strategy.find_or_create_by_name({:name => 'Take a stand',:content=>'
<div class="row-fluid">
<div class="span6"> 
<p>Get off your chair as much as you can. Even standing and pacing every so often can count towards your step target.</p>
</div>
<div class="span6">
 <table id="datatable_example" class="responsive table table-striped table-bordered" style="width:100%;margin-bottom:0; ">
  <thead> <tr> <th class="">Key benefits:</th> </tr> </thead> 
  <tbody> <tr> <td>10-100 steps gained</td> </tr> 
  <tr> <td>Better energy levels</td> </tr> 
  </tbody> 
  </table>
  </div>
  </div>'
    } )
strategy4.strategy_type = 'support'
strategy4.phase = phase2
phase2.strategies << strategy4

puts 'Strategy:' << strategy4.name

strategy5 = Strategy.find_or_create_by_name({:name => 'Stand-Walk-Talk',:content=>'
<div class="row-fluid">
<div class="span6"> 
<p>Rather than meeting with a colleague sitting down, stand or take a walk-talk meeting. Take your phone calls standing or on the move either around or outside your office.</p>

</div>
<div class="span6">
 <table id="datatable_example" class="responsive table table-striped table-bordered" style="width:100%;margin-bottom:0; ">
  <thead> <tr> <th class="">Key benefits:</th> </tr> </thead> 
  <tbody> <tr> <td>200-1000 steps gained</td> </tr> 
  <tr> <td>Increase your sense of job satisfaction</td> </tr> 
  </tbody> 
  </table>
  </div>
  </div>'
} )
strategy5.strategy_type = 'support'
strategy5.phase = phase2
phase2.strategies << strategy5

puts 'Strategy:' << strategy5.name



#############################################
#Strategies Phase 2
#############################################

strategy21 = Strategy.find_or_create_by_name({:name => 'Walk as part of travelling to and from work',:content=>'
<div class="row-fluid">
<div class="span6"> 
<p>You have to travel to and from work. If it&#39s appropriate, why not combine a walk with public transport once in a while? Have a look at where the most convenient public transport stops are for you to incorporate a walk into your work journey. </p>

</div>
<div class="span6">
 <table id="datatable_example" class="responsive table table-striped table-bordered" style="width:100%;margin-bottom:0; ">
  <thead> <tr> <th class="">Key benefits:</th> </tr> </thead> 
  <tbody> <tr> <td>500-1000 steps gained</td> </tr> 
  <tr> <td>Time to think and relax before and after work</td> </tr> 
  </tbody> 
  </table>
  </div>
  </div>'
} )
strategy21.strategy_type = 'support'
strategy21.phase = phase3
phase3.strategies << strategy21

puts 'Strategy:' << strategy21.name

strategy22 = Strategy.find_or_create_by_name({:name => 'Take a Break',:content=>'
<div class="row-fluid">
<div class="span6"> 
<p>Take a quick 10 minute walk during a work break, perhaps with other colleagues. Use this time to leave your desk and do something that is beneficial to your health and wellbeing.</p>

</div>
<div class="span6">
 <table id="datatable_example" class="responsive table table-striped table-bordered" style="width:100%;margin-bottom:0; ">
  <thead> <tr> <th class="">Key benefits:</th> </tr> </thead> 
  <tbody> <tr> <td>500-1000 steps gained</td> </tr> 
  <tr> <td>Energise yourself before, during or after work.</td> </tr> 
    <tr> <td>Take some personal time and space.</td> </tr> 
  </tbody> 
  </table>
  </div>
  </div>'
} )
strategy22.strategy_type = 'support'
strategy22.phase = phase3
phase3.strategies << strategy22

puts 'Strategy:' << strategy22.name


phase3.strategies << strategy
phase3.strategies << strategy2
phase3.strategies << strategy3
phase3.strategies << strategy4
phase3.strategies << strategy5



#############################################
#Strategies Phase 3
#############################################

strategy31 = Strategy.find_or_create_by_name({:name => 'Office walking group',:content=>'
<div class="row-fluid">
<div class="span6"> 
<p>Meet up and walk with a colleague.  It&#39s great getting out of the office when you know someone is waiting for you!</p>

</div>
<div class="span6">
 <table id="datatable_example" class="responsive table table-striped table-bordered" style="width:100%;margin-bottom:0; ">
  <thead> <tr> <th class="">Key benefits:</th> </tr> </thead> 
  <tbody> <tr> <td>2000-3000 steps gained</td> </tr> 
  <tr> <td>Social networking</td> </tr> 
  <tr> <td>Motivation</td> </tr> 
  <tr> <td>Effectively planning your walk</td> </tr> 
  </tbody> 
  </table>
  </div>
  </div>'
} )
strategy31.strategy_type = 'support'
strategy31.phase = phase4
phase4.strategies << strategy31

strategy32 = Strategy.find_or_create_by_name({:name => 'Walk to work',:content=>'
<div class="row-fluid">
<div class="span6"> 
<p>How close do you live from work? Type your home address into Google maps, click on directions then enter your work address. If you feel you live too far away to walk into work, combine your walking with public transport.</p>

</div>
<div class="span6">
 <table id="datatable_example" class="responsive table table-striped table-bordered" style="width:100%;margin-bottom:0; ">
  <thead> <tr> <th class="">Key benefits:</th> </tr> </thead> 
  <tbody> <tr> <td>3000 steps gained</td> </tr> 
  <tr> <td>Save money on transport and gym membership!</td> </tr> 
  <tr> <td>Environmentally friendly</td> </tr> 
  </tbody> 
  </table>
  </div>
  </div>'
} )
strategy32.strategy_type = 'support'
strategy32.phase = phase4
phase4.strategies << strategy32

strategy33 = Strategy.find_or_create_by_name({:name => 'Make a date',:content=>'
<div class="row-fluid">
<div class="span6"> 
<p>Whether you want to walk with others or walk on your own, schedule it as an activity. You are more likely to stick to your good habit if it is part of your working day.
</p>

</div>

  </div>'
} )
strategy33.strategy_type = 'support'
strategy33.phase = phase4
phase4.strategies << strategy33


strategy34 = Strategy.find_or_create_by_name({:name => 'Check out a new cafe or restaurant',:content=>'
<div class="row-fluid">
<div class="span6">
<p>On your coffee or lunch break, check out a cafe or restaurant you&#39ve never been to before. Try to pick a new place every week or couple of weeks, and discover new areas around campus while you&#39re at it. For ideas on where to eat, try http://www.blogto.com/restaurants or, do a Google search for cafes in the neighbourhood you&#39d like to explore.</p>

</div>
<div class="span6">
 <table id="datatable_example" class="responsive table table-striped table-bordered" style="width:100%;margin-bottom:0; ">
  <thead> <tr> <th class="">Key benefits:</th> </tr> </thead> 
  <tbody> <tr> <td>1000-3000 steps gained</td> </tr> 
  <tr> <td>Social networking</td> </tr> 
  <tr> <td>Motivation</td> </tr> 
  <tr> <td>Discovering new points of interest in your local neighbourhood</td> </tr> 
  </tbody> 
  </table>
  </div>
  </div>'
} )
strategy34.strategy_type = 'support'
strategy34.phase = phase4
phase4.strategies << strategy34


strategy35 = Strategy.find_or_create_by_name({:name => 'Rock while you Walk',:content=>'
<div class="row-fluid">
<div class="span6"> 
<p>Bring your iPod or portable music device and listen to your favourite tunes as you walk. Make sure to pick upbeat, motivating music to energize you as you walk. Since you will be on the move, this gives you the freedom to turn up the volume a few notches, as well!</p>

</div>
  </div>'
} )
strategy35.strategy_type = 'support'
strategy35.phase = phase4
phase4.strategies << strategy35

phase4.strategies << strategy21
phase4.strategies << strategy22

phase4.strategies << strategy
phase4.strategies << strategy2
phase4.strategies << strategy3
phase4.strategies << strategy4
phase4.strategies << strategy5

#############################################
#Strategies Phase 4 and 5
#############################################

strategy41 = Strategy.find_or_create_by_name({:name => 'Step together',:content=>'
<div class="row-fluid">
<div class="span6"> 
<p>Community walking groups are a fantastic way to increase your walking whilst meeting new people, strengthening your community connections and exploring your local area. There are many volunteer led walking groups that vary in size and are often free to be involved in.</p>
<p>A terrific resource for us here at the University of Toronto is the Organizational Development and Learning Centre. Check out www.utoronto.ca/hrhome/odlc/wlb/discamp.htm for a list of guided walks right here on campus.</p>
<p>You might also try looking for a walking group near your workplace or home for weekends and evenings. Most Running Room (http://www.runningroom.com) locations offer running groups, for all ability levels; see if your local Running Room has a walking group-if not, talk to the manager there about starting one up!</p>
</div>
  </div>'
} )
strategy41.strategy_type = 'support'
strategy41.phase = phase5
phase5.strategies << strategy41
phase6.strategies << strategy41

strategy42 = Strategy.find_or_create_by_name({:name => 'Step up and lend a hand',:content=>'
<div class="row-fluid">
<div class="span6"> 
<p>Volunteering is a great way to help others and also keep your step count up. You can volunteer as a walk leader for a local walking group - and motivate others to be active at the same time! Are there charity organisations in your area that would appreciate your assistance? How about a local community garden to get actively involved in?</p>

</div>
  </div>'
} )
strategy42.strategy_type = 'support'
strategy42.phase = phase5
phase5.strategies << strategy42
phase6.strategies << strategy42

strategy43 = Strategy.find_or_create_by_name({:name => 'Walk@Weekends',:content=>'
<div class="row-fluid">
<div class="span6"> 
<p>Start your weekend with a morning walk. If you are meeting up with friends, take a walk together before or after sitting for lunch. Can you take an active family outing? See how many extra steps you can get while shopping at the mall or markets. Think of all your opportunities to be active beyond the workplace.</p>

</div>
  </div>'
} )
strategy43.strategy_type = 'support'
strategy43.phase = phase5
phase5.strategies << strategy43
phase6.strategies << strategy43


strategy44 = Strategy.find_or_create_by_name({:name => 'Share your stepping',:content=>'
<div class="row-fluid">
<div class="span6"> 
<p>Do you have family or friends who could share the benefits you&#39ve gained from being more active? Why not take a short walk together and help to get them involved. It&#39s also a great way to stay motivated! 
</p>

</div>
  </div>'
} )
strategy44.strategy_type = 'support'
strategy44.phase = phase5
phase5.strategies << strategy44
phase6.strategies << strategy44

phase5.strategies << strategy31
phase5.strategies << strategy32
phase5.strategies << strategy33
phase5.strategies << strategy34
phase5.strategies << strategy35

phase5.strategies << strategy21
phase5.strategies << strategy22

phase5.strategies << strategy
phase5.strategies << strategy2
phase5.strategies << strategy3
phase5.strategies << strategy4
phase5.strategies << strategy5


phase6.strategies << strategy31
phase6.strategies << strategy32
phase6.strategies << strategy33
phase6.strategies << strategy34
phase6.strategies << strategy35

phase6.strategies << strategy21
phase6.strategies << strategy22

phase6.strategies << strategy
phase6.strategies << strategy2
phase6.strategies << strategy3
phase6.strategies << strategy4
phase6.strategies << strategy5


 
#############################################
#Setup Routes
#############################################

strategy6 = Strategy.find_or_create_by_name({:name => 'King&#39s College Circle',:content=>'
<div class="row-fluid">
<div class="span6"> 
<p>Take a brisk walk around King&#39;s College Circle, noticing the stunning architecture of University College and the lively presence of students going to class.</p>

</div>
<div class="span6">
 <table id="datatable_example" class="responsive table table-striped table-bordered" style="width:100%;margin-bottom:0; ">
  <thead> <tr> <th class="">Details:</th> </tr> </thead> 
  <tbody> <tr> <td>800 steps</td> </tr> 
  <tr> <td>5 minutes</td> </tr> 
  <tr> <td>1732 ft</td> </tr> 
  </tbody> 
  </table>
  </div>
  </div>'
} )




strategy6.strategy_type = 'route'
strategy6.map_image_url  = 'images/general/route_1.png'
strategy6.map_url= 'https://maps.google.com/maps/ms?ie=UTF8&msa=0&msid=204383247915975342761.000495fa05da6cd10a9dd&ll=43.663487,-79.396675&spn=0.007171,0.013754&t=h&z=16'

strategy6.phase = phase2
phase2.strategies << strategy6

puts 'Strategy:' << strategy6.name


strategy7 = Strategy.find_or_create_by_name({:name => 'Queen&#39;s Park Crescent',:content=>'
<div class="row-fluid">
<div class="span6"> 
<p>Starting at any point on Queen&#39;s Park Crescent, walk in a figure 8 to cover the entire crescent. Wander through the trees and watch the squirrels, in this little haven of peace in the midst of busy streets.</p>
</div>
<div class="span6">
 <table id="datatable_example" class="responsive table table-striped table-bordered" style="width:100%;margin-bottom:0; ">
  <thead> <tr> <th class="">Details:</th> </tr> </thead> 
  <tbody> <tr> <td>1250 steps</td> </tr> 
  <tr> <td>10 minutes</td> </tr> 
  <tr> <td>3127 ft</td> </tr> 
  </tbody> 
  </table>
  </div>
  </div>'
} )
strategy7.strategy_type = 'route'
strategy7.map_image_url  = 'images/general/route_2.png'
strategy7.map_url= 'https://maps.google.com/maps/ms?ie=UTF8&msa=0&msid=204383247915975342761.000495fa05da6cd10a9dd&ll=43.663487,-79.396675&spn=0.007171,0.013754&t=h&z=16'

strategy7.phase = phase2
phase2.strategies << strategy7

puts 'Strategy:' << strategy7.name



strategy8 = Strategy.find_or_create_by_name({:name => 'Victoria College Walk',:content=>'
<div class="row-fluid">
<div class="span6"> 
<p>From J.M. Kelly Library, meander north along scenic pathways through the historic buildings of Victoria College. As you head back, take in the feel of busy Queen&#39;s Park Circle and tranquil Queen&#39;s Park set amongst it.</p>
</div>
<div class="span6">
 <table id="datatable_example" class="responsive table table-striped table-bordered" style="width:100%;margin-bottom:0; ">
  <thead> <tr> <th class="">Details:</th> </tr> </thead> 
  <tbody> <tr> <td>1250 steps</td> </tr> 
  <tr> <td>10 minutes</td> </tr> 
  <tr> <td>3187 ft</td> </tr> 
  </tbody> 
  </table>
  </div>
  </div>'
} )
strategy8.strategy_type = 'route'
strategy8.map_image_url  = 'images/general/route_3.png'
strategy8.map_url= 'https://maps.google.com/maps/ms?ie=UTF8&msa=0&msid=204383247915975342761.000495fa05da6cd10a9dd&ll=43.663487,-79.396675&spn=0.007171,0.013754&t=h&z=16'

strategy8.phase = phase2
phase2.strategies << strategy8

puts 'Strategy:' << strategy8.name


strategy9 = Strategy.find_or_create_by_name({:name => 'Athletic Centre Neighbourhood',:content=>'
<div class="row-fluid">
<div class="span6"> 

<p>Starting at the Athletic Centre doors, head north on Spadina and then turn in to the surrounding neighbourhood. See classic Toronto homes from the comfort of relatively quiet side streets.</p>


</div>
<div class="span6">
 <table id="datatable_example" class="responsive table table-striped table-bordered" style="width:100%;margin-bottom:0; ">
  <thead> <tr> <th class="">Details:</th> </tr> </thead> 
  <tbody> <tr> <td>1000 steps</td> </tr> 
  <tr> <td>8 minutes</td> </tr> 
  <tr> <td>2364 ft</td> </tr> 
  </tbody> 
  </table>
  </div>
  </div>'
} )
strategy9.strategy_type = 'route'
strategy9.map_image_url  = 'images/general/route_4.png'
strategy9.map_url= 'https://maps.google.com/maps/ms?ie=UTF8&msa=0&msid=204383247915975342761.000495fa05da6cd10a9dd&ll=43.663487,-79.396675&spn=0.007171,0.013754&t=h&z=16'

strategy9.phase = phase2
phase2.strategies << strategy9

puts 'Strategy:' << strategy9.name

strategy10 = Strategy.find_or_create_by_name({:name => 'Yorkville Shops Walk',:content=>'
<div class="row-fluid">
<div class="span6"> 

<p>Step out from OISE and head towards Yorkville, taking in the energy of Bloor Street and Avenue Road as well as the sophisticated vibe of upscale boutiques and bistros on Yorkville and Cumberland. Depending on when you go, you may even spot a celebrity!</p>


</div>
<div class="span6">
 <table id="datatable_example" class="responsive table table-striped table-bordered" style="width:100%;margin-bottom:0; ">
  <thead> <tr> <th class="">Details:</th> </tr> </thead> 
  <tbody> <tr> <td>2100 steps</td> </tr> 
  <tr> <td>17 minutes</td> </tr> 
  <tr> <td>1 mi</td> </tr> 
  </tbody> 
  </table>
  </div>
  </div>'
} )
strategy10.strategy_type = 'route'
strategy10.map_image_url  = 'images/general/route_5.png'
strategy10.map_url= 'https://maps.google.com/maps/ms?ie=UTF8&msa=0&msid=204383247915975342761.000495fa05da6cd10a9dd&ll=43.663487,-79.396675&spn=0.007171,0.013754&t=h&z=16'

strategy10.phase = phase2
phase2.strategies << strategy10

puts 'Strategy:' << strategy10.name

strategy11 = Strategy.find_or_create_by_name({:name => 'Urban Block Walk',:content=>'
<div class="row-fluid">
<div class="span6"> 

<p>Follow Devonshire Place, a relatively quiet backstreet, and discover the shortcut at the tennis courts. Emerge beside the Innis College residence building onto bustling St George Street and down past the unique architectural design of Robart&#39;s Library.</p>


</div>
<div class="span6">
 <table id="datatable_example" class="responsive table table-striped table-bordered" style="width:100%;margin-bottom:0; ">
  <thead> <tr> <th class="">Details:</th> </tr> </thead> 
  <tbody> <tr> <td>1000 steps</td> </tr> 
  <tr> <td>8 minutes</td> </tr> 
  <tr> <td>2300 ft.</td> </tr> 
  </tbody> 
  </table>
  </div>
  </div>'
} )
strategy11.strategy_type = 'route'
strategy11.map_image_url  = 'images/general/route_6.png'
strategy11.map_url= 'https://maps.google.com/maps/ms?ie=UTF8&msa=0&msid=204383247915975342761.000495fa05da6cd10a9dd&ll=43.663487,-79.396675&spn=0.007171,0.013754&t=h&z=16'

strategy11.phase = phase2
phase2.strategies << strategy11

puts 'Strategy:' << strategy11.name

strategy12 = Strategy.find_or_create_by_name({:name => 'Earth Sciences Complex',:content=>'
<div class="row-fluid">
<div class="span6"> 

<p>Discover the open-concept covered walkway that runs alongside the Earth Sciences buildings, running parallel to the buildings just west of Huron Street. Emerge at cobblestoned Bancroft Avenue, and hug the edge of Spadina Circle as you loop back towards the Earth Sciences buildings.</p>


</div>
<div class="span6">
 <table id="datatable_example" class="responsive table table-striped table-bordered" style="width:100%;margin-bottom:0; ">
  <thead> <tr> <th class="">Details:</th> </tr> </thead> 
  <tbody> <tr> <td>800 steps</td> </tr> 
  <tr> <td>6 minutes</td> </tr> 
  <tr> <td>1900 ft.</td> </tr> 
  </tbody> 
  </table>
  </div>
  </div>'
} )
strategy12.strategy_type = 'route'
strategy12.map_image_url  = 'images/general/route_7.png'
strategy12.map_url= 'https://maps.google.com/maps/ms?ie=UTF8&msa=0&msid=204383247915975342761.000495fa05da6cd10a9dd&ll=43.663487,-79.396675&spn=0.007171,0.013754&t=h&z=16'

strategy12.phase = phase2
phase2.strategies << strategy12

puts 'Strategy:' << strategy12.name

strategy13 = Strategy.find_or_create_by_name({:name => 'South Campus Loop',:content=>'
<div class="row-fluid">
<div class="span6"> 

<p>Weave your way through the concrete behemoth of the Medical Sciences Building, then hug the south rim of King&#39;s College Circle, past iconic Convocation Hall, before connecting to busy St George Street. Loop back along College Street, with its mix of historic buildings and modern gems. You may want to consider stopping in at the Terrence Donnelly Centre, for a stroll amongst its impressive indoor forest sanctuary.</p>


</div>
<div class="span6">
 <table id="datatable_example" class="responsive table table-striped table-bordered" style="width:100%;margin-bottom:0; ">
  <thead> <tr> <th class="">Details:</th> </tr> </thead> 
  <tbody> <tr> <td>1500 steps</td> </tr> 
  <tr> <td>13 minutes</td> </tr> 
  <tr> <td>4000 ft.</td> </tr> 
  </tbody> 
  </table>
  </div>
  </div>'
} )
strategy13.strategy_type = 'route'
strategy13.map_image_url  = 'images/general/route_8.png'
strategy13.map_url= 'https://maps.google.com/maps/ms?ie=UTF8&msa=0&msid=204383247915975342761.000495fa05da6cd10a9dd&ll=43.663487,-79.396675&spn=0.007171,0.013754&t=h&z=16'

strategy13.phase = phase2
phase2.strategies << strategy13

puts 'Strategy:' << strategy13.name

strategy14 = Strategy.find_or_create_by_name({:name => 'Historic Buildings Walk',:content=>'
<div class="row-fluid">
<div class="span6"> 

<p>Enjoy all the charms of the University as you take a relaxing scenic stroll around Queen&#39;s Park to St. Mike&#39;s past Victoria College, along Philosopher&#39;s Walk, to Hart House and Trinity College.</p>


</div>
<div class="span6">
 <table id="datatable_example" class="responsive table table-striped table-bordered" style="width:100%;margin-bottom:0; ">
  <thead> <tr> <th class="">Details:</th> </tr> </thead> 
  <tbody> <tr> <td>2200 steps</td> </tr> 
  <tr> <td>18 minutes</td> </tr> 
  <tr> <td>1.11 mi.</td> </tr> 
  </tbody> 
  </table>
  </div>
  </div>'
} )
strategy14.strategy_type = 'route'
strategy14.map_image_url  = 'images/general/route_14.png'
strategy14.map_url= 'https://maps.google.com/maps/ms?ie=UTF8&msa=0&msid=204383247915975342761.000495fa05da6cd10a9dd&ll=43.663487,-79.396675&spn=0.007171,0.013754&t=h&z=16'

strategy14.phase = phase2
phase2.strategies << strategy14

puts 'Strategy:' << strategy14.name


strategy15 = Strategy.find_or_create_by_name({:name => 'Museum subway underpass',:content=>'
<div class="row-fluid">
<div class="span6"> 

<p>Head underground via the tunnel which connects the east side and west side of Queen&#39;s Park Avenue.</p>


</div>
<div class="span6">
 <table id="datatable_example" class="responsive table table-striped table-bordered" style="width:100%;margin-bottom:0; ">
  <thead> <tr> <th class="">Details:</th> </tr> </thead> 
  <tbody> <tr> <td>??? steps</td> </tr> 
  <tr> <td>?? minutes</td> </tr> 
  <tr> <td>?? mi.</td> </tr> 
  </tbody> 
  </table>
  </div>
  </div>'
} )
strategy15.strategy_type = 'route'
strategy15.map_image_url  = 'images/general/route_15.png'
strategy15.map_url= 'https://maps.google.com/maps/ms?ie=UTF8&msa=0&msid=204383247915975342761.000495fa05da6cd10a9dd&ll=43.663487,-79.396675&spn=0.007171,0.013754&t=h&z=16'

strategy15.phase = phase2
phase2.strategies << strategy15

puts 'Strategy:' << strategy15.name

strategy16 = Strategy.find_or_create_by_name({:name => 'West Campus Long Loop',:content=>'
<div class="row-fluid">
<div class="span6"> 

<p>This diverse walk takes you down the peaceful Philosopher&#39;s Walk, through the thriving heart of campus at Hart House Cirle and King&#39;s College Circle, then down around the southwestern corner of campus bordering Chinatown at Spadina Circle. From there, head through the outdoor covered walkway of the Earth Sciences department, then past the Athletic Centre and up through a historic neighbourhood, and back to bustling Bloor Street to complete the loop.</p>


</div>
<div class="span6">
 <table id="datatable_example" class="responsive table table-striped table-bordered" style="width:100%;margin-bottom:0; ">
  <thead> <tr> <th class="">Details:</th> </tr> </thead> 
  <tbody> <tr> <td>4000 steps</td> </tr> 
  <tr> <td>30 minutes</td> </tr> 
  <tr> <td>2 mi.</td> </tr> 
  </tbody> 
  </table>
  </div>
  </div>'
} )
strategy16.strategy_type = 'route'
strategy16.map_image_url  = 'images/general/route_16.png'
strategy16.map_url= 'https://maps.google.com/maps/ms?ie=UTF8&msa=0&msid=204383247915975342761.000495fa05da6cd10a9dd&ll=43.663487,-79.396675&spn=0.007171,0.013754&t=h&z=16'

strategy16.phase = phase2
phase2.strategies << strategy16

puts 'Strategy:' << strategy16.name

#############################################
#Setup Artciles
#############################################

article = Article.find_or_create_by_name({ :name => 'What is RISE@Work?', :content=>'<p>RISE@Work is a brand new, innovative and interactive web application and research platform designed to assist Canadian employees to reduce their sitting time and increase their physical activity. </p><p> Sedentary behaviour, in particular sitting time, is an emerging public health concern associated with an increased risk of chronic diseases. Studies show that Canadian adults are sedentary for 9.5 hours per day (approximately 69% of their waking hours), with many adults spending up to one-half of their work day sitting. In addition, only 15% of adults are currently meeting the Canadian Physical Activity Guidelines for Adults that recommends 150 minutes of moderate to vigorous physical activity each week. </p>' }, :without_protection => true)
puts 'Article:' << article.name

article = Article.find_or_create_by_name({ :name => 'Who We Are', :content=>'<p>The RISE@Work team is primarily based at the Health and Exercise Psychology Unit within the Faculty of Kinesiology & Physical Education at the University of Toronto.' }, :without_protection => true)
puts 'Article:' << article.name

article = Article.find_or_create_by_name({ :name => 'Why join RISE@Work?', :content=>'<p> Over the course of this 12-week intervention, you will learn a variety of practical and easy-to-use strategies to reduce the time that you spend sitting at your desk and increase the number of steps that you take in a day. These strategies are based on extensive research in how to change and maintain healthy behaviours and have been developed by the RISE@Work team.</p>' }, :without_protection => true)
puts 'Article:' << article.name

article = Article.find_or_create_by_name({ :name => 'NOTIFICATIONS', :content=>'<p><b>Sep. 14/13 :</b>Remember to log your steps every single day. If you happen to miss a day or two, you can still log these steps. Steps can be logged for up to 3 days at a time: today, yesterday and the day before yesterday. Good luck!</p>' }, :without_protection => true)
puts 'Article:' << article.name
article = Article.find_or_create_by_name({ :name => 'Help', :content=>'
<p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>
      <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
      <h4>Vivamus sagittis lacus vel augue?</h4>
      <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem.</p>
      <h4>Donec sed odio dui?</h4>
      <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>
      <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
      <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus auctor fringilla.</p>
      <h4>Praesent commodo cursus?</h4>
      <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>
      <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
      <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus auctor fringilla.</p>
' }, :without_protection => true)
puts 'Article:' << article.name

article = Article.find_or_create_by_name({ :name => 'About Us', :content=>'<p>The RISE@Work team is primarily based at the Health and Exercise Psychology Unit within the Faculty of Kinesiology & Physical Education at the University of Toronto. </p><h4>Primary Investigator: <b>Dr. Guy Faulkner</b></h4><p>Dr. Faulkner&#39;s expertise is in developing physical activity promotion interventions, and examining relationships between physical activity and positive mental health. </p><h4> Co-Investigator: <b>Dr. Kelly Arbour-Nicitopoulos</b></h4> <p>Dr. Arbour-Nicitopoulos&#39; expertise is in the design and delivery of clinical and community-based health promotion initiatives. </p><h4> Co-Investigator: <b>Dr. Michelle Stone</b></h4> <p>Dr. Michelle Stone&#39;s expertise is in examining patterns of physical activity and inactivity and how they relate to physiological and psychological health outcomes. She is based at the School of Health and Health Performance at Dalhousie University.</p> <h4>Research Coordinator: <b>Dr. Subha Ramanathan</b></h4> <p>Dr. Subha Ramanathan&#39;s expertise is in examining physical activity participation from community and public health perspectives.</p>' }, :without_protection => true)
puts 'Article:' << article.name

article = Article.find_or_create_by_name({ :name => 'EUA', :content=>
'Rise@Work Participant Information

Thank you for expressing an interest in participating in Rise@Work, an exciting health initiative in your workplace. Before you decide to take this great opportunity, it&#39;s important that we explain the procedure clearly to you.

We are interested in exploring initiatives to get people moving more and sitting less in the workplace.  We would like to invite you to participate in a 10 week walking program conducted at your worksite. The research findings will be particularly valuable in the development of future health promotion strategies in office workplaces. 

What will you be required to do?

The Rise@Work program encourages you to gradually increase your walking in the workplace over a period of 10 weeks. We will provide you with a pedometer - a simple, discrete tool that measures the steps you take each day - and access to the Rise@Work website which contains a range of practical support tools to help you achieve your goals. Throughout the program we would like you to record the number of steps you take during a working day. All information collected will be confidential and completely anonymous. The program&#39;s strategies to promote walking are designed to complement rather than disrupt your workday, and reporting your step count is quick and simple. In addition, we will ask you to complete a brief questionnaire that will include questions about your age, sex, occupation, educational qualifications, general health and lifestyle behaviours. During and following the study, we will ask for feedback on your experiences and perceptions regarding the Rise@Work program. Again, this information will be kept entirely confidential.

Rise@Work is developed and conducted by experienced researchers who are available throughout the program to assist with any concerns or queries. 

I have read and understand this participant information provided to me concerning this initiative and I agree to participate in the Rise@Work study.  

I understand that: 
- Taking part in the study involves participation in a 10 week workplace walking program using a website and collection of data on step counts. 
- Throughout the program I will be asked to wear a pedometer and record my step count during my working day.  
- During and following the study, I may be asked by researchers to report on my experiences and perceptions regarding the Rise@Work program. 
- Participation in this study is voluntary. I can withdraw from the initiative at any time without penalty by informing the Rise@Work research team and do not have to give reasons for withdrawing.  
- All information will be confidential and only anonymous summary data will be reported. The data collected may be published in such a way that my name is not used, and that I can not be identified in any way.'
 }, :without_protection => true)
puts 'Article:' << article.name

homedashboard = HomeDashboard.find_or_create_by_home_dashboard_id({ :home_dashboard_id => '1', :people_walking =>'0',:steps_taken_daily=>'0', :steps_increasing_weekly=>'0', :total_steps_taken=>'0',:total_days_of_activity=>'0' }, :without_protection => true)
puts 'HomeDashboard:' << homedashboard.home_dashboard_id


#############################################
#Setup Action Messages
#############################################

message_action_1 = MessageAction.find_or_create_by_subject({ :subject => 'Test Mailer', :body=>'<p> Body Test with HTML </p>' }, :without_protection => true)
puts 'Message Action:' << message_action_1.subject
message_action_1.phase = phase
message_action_1.day_to_send = 0
 phase.message_actions << message_action_1

 message_action_2 = MessageAction.find_or_create_by_subject({ :subject => 'Test Mailer 2', :body=>'<p> Body Test with HTML 2</p>' }, :without_protection => true)
puts 'Message Action:' << message_action_2.subject
message_action_2.phase = phase
message_action_2.day_to_send = 1
phase.message_actions << message_action_2


#############################################
#Setup Achievements
#############################################

achievement1 = Achievement.find_or_create_by_name({:name => '1K Steps',:description => 'Walked 1000 steps', :image =>'checkbox.png' }, :without_protection => true)
achievement2 = Achievement.find_or_create_by_name({:name => '5K Steps',:description => 'Walked 5000 steps', :image =>'comment.png' }, :without_protection => true)
achievement3 = Achievement.find_or_create_by_name({:name => '10K Steps',:description => 'Walked 10000 steps', :image =>'radio.png' }, :without_protection => true)

achievement4 = Achievement.find_or_create_by_name({:name => 'Baseline',:description => 'Completed Baseline', :image =>'checkbox.png' }, :without_protection => true)
achievement5 = Achievement.find_or_create_by_name({:name => 'Phase 1',:description => 'Completed Phase 1', :image =>'comment.png' }, :without_protection => true)
achievement6 = Achievement.find_or_create_by_name({:name => 'Phase 2',:description => 'Completed Phase 2', :image =>'radio.png' }, :without_protection => true)

achievement7 = Achievement.find_or_create_by_name({:name => 'First Task',:description => 'Completed first task', :image =>'checkbox.png' }, :without_protection => true)
achievement8 = Achievement.find_or_create_by_name({:name => '10 Tasks',:description => 'Completed 10 tasks', :image =>'comment.png' }, :without_protection => true)
achievement9 = Achievement.find_or_create_by_name({:name => '20 Tasks',:description => 'Completed 20 tasks', :image =>'radio.png' }, :without_protection => true)

#############################################
#Setup Organization
#############################################

organization = Organization.find_or_create_by_name({:name => 'University Of Toronto',:secret_key => '12345' }, :without_protection => true)
puts 'Organization:' << organization.name

#############################################
#Setup Survey
#############################################

baselinesurvey = Survey.find_or_create_by_name({:name => 'Baseline',:title=>'RISE@Work Baseline Questionnaire',:description => 'Before you begin the RISE@Work program, we are interested in finding out about your general health and wellbeing.'}, :without_protection => true)
baselinesurvey.save


#####Sections


section1 = SurveySection.find_or_create_by_name({:name => 'Section1',:title=>'Section 1: Getting to Know You',:description => 'Please answer the following demographic questiosn so that we may know you better.'}, :without_protection => true)
section1.save

baselinesurvey.survey_sections <<  section1;

section2 = SurveySection.find_or_create_by_name({:name => 'Section2',:title=>'Section 2: Your Physical Activity',:description => 'Please answer the following demographic questiosn so that we may know you better.'}, :without_protection => true)
section2.save

baselinesurvey.survey_sections <<  section2;

section3 = SurveySection.find_or_create_by_name({:name => 'Section3',:title=>'Section 3: Your Sitting',:description => 'Please answer the following demographic questiosn so that we may know you better.'}, :without_protection => true)
section3.save

baselinesurvey.survey_sections <<  section3;

section4 = SurveySection.find_or_create_by_name({:name => 'Section4',:title=>'Section 4: Your Work',:description => 'Please answer the following demographic questiosn so that we may know you better.'}, :without_protection => true)
section4.save

baselinesurvey.survey_sections <<  section4;

section5 = SurveySection.find_or_create_by_name({:name => 'Section5',:title=>'Section 5: General  Wellbeing',:description => 'Please answer the following demographic questiosn so that we may know you better.'}, :without_protection => true)
section5.save

baselinesurvey.survey_sections <<  section5;




###### Intro Questions ######
question0 = SurveyQuestion.find_or_create_by_name({:name => 'Information0',:description=>'<p>Before you begin the RISE@Work program, we are interested in finding out about your general health and wellbeing.</p>
<p>The questionnaire will take about 15 minutes to complete. All of the information that you provide will be kept in the strictest confidence.</p>
<p>Please read and answer every question to the best of your ability. For questions that ask you to report a time duration, please be as accurate as you can. For questions that ask you to select one answer from a range of options, choose the answer that best describes your situation or how you feel.</p>',:question_type => 'INFORMATION'}, :without_protection => true)

question0.save
baselinesurvey.survey_questions <<  question0;
section1.survey_questions <<  question0;
question0.survey_section = section1

question20 = SurveyQuestion.find_or_create_by_name({:name => 'Information20',:description=>'<p>The next set of questions focus on your current physical activity levels. We are interested in finding out about the kinds of physical activities that people do as part of their everyday lives.  The questions will ask you about the time you spent being physically active in the <b><u>last 7 days</u></b>.  Please answer each question even if you do not consider yourself to be an active person.  Please think about the activities you do at work, as part of your house and yard work, to get from place to place, and in your spare time for recreation, exercise or sport.</p>',:question_type => 'INFORMATION'}, :without_protection => true)


question20.save
baselinesurvey.survey_questions <<  question20;
section2.survey_questions <<  question20;
question20.survey_section = section2


question30 = SurveyQuestion.find_or_create_by_name({:name => 'Information31',:description=>'<p>For the following section, we are interested in learning more about your work environment. In particular, these next set of questions ask about the type of job you currently are employed at, the amount of time you usually spend at work, how you typically travel to and from work, as well as any physical activity you may participate in at work. </p>',:question_type => 'INFORMATION'}, :without_protection => true)


question30.save
baselinesurvey.survey_questions <<  question30;
section3.survey_questions <<  question30;
question30.survey_section = section3


question40 = SurveyQuestion.find_or_create_by_name({:name => 'Information40',:description=>'<p>For the following section, we are interested in learning more about your work environment. In particular, these next set of questions ask about the type of job you currently are employed at, the amount of time you usually spend at work, how you typically travel to and from work, as well as any physical activity you may participate in at work. </p>',:question_type => 'INFORMATION'}, :without_protection => true)


question40.save
baselinesurvey.survey_questions <<  question40;
section4.survey_questions <<  question40;
question40.survey_section = section4

question401 = SurveyQuestion.find_or_create_by_name({:name => 'Information401',:description=>'<p>Health problems can make it difficult for employees to perform certain aspects of their jobs.  We are interested in learning about how your health may have affected you at work over the <u>past 2 weeks</u>. The next eight questions will ask you to think about your physical health or emotional problems.  These refer to any <u>ongoing or permanent medical conditions</u> you may have and the effects of any <u>treatments</u> you are taking for these conditions.  Emotional problems may include feeling depressed or anxious.
</p>',:question_type => 'INFORMATION'}, :without_protection => true)


question401.save
baselinesurvey.survey_questions <<  question401;
section4.survey_questions <<  question401;
question401.survey_section = section4


question50 = SurveyQuestion.find_or_create_by_name({:name => 'Information50',:description=>'<p>For the final section of this questionnaire, we are interested in learning about your overall satisfaction with different aspects of your life. In particular, these next set of questions refer to satisfaction with your physical, social, and emotional functioning.</p>',:question_type => 'INFORMATION'}, :without_protection => true)


question50.save
baselinesurvey.survey_questions <<  question50;
section5.survey_questions <<  question50;
question50.survey_section = section4



####### descriptions


@description = 'We are interested in finding out about the kinds of physical activities that people do as part of their everyday lives.  These questions will ask you about your demographics.'
@description2 = '<b>Vigorous Physical Activity</b><p>Think about all the vigorous activities that you did in the last 7 days.  Vigorous physical activities refer to activities that take hard physical effort and make you breathe much harder than normal. Think only about those physical activities that you did for at least 10 minutes at a time.</p>'
@description3 = '<b>Moderate Physical Activity</b><p>Think about all the <b>moderate</b> activities that you did in the <b>last 7 days.  Moderate</b> activities refer to activities that take <b><u>moderate physical effort</u></b> and make you <b><u>breathe somewhat harder than normal</u></b>. Again, think only about those physical activities that you did for <u>at least 10 minutes at a time.</u></p>'
@description4 = '<b>Walking</b><p>Think about the time you spent <b>walking</b> in the <b>last 7 days</b>.  This includes at work and at home, walking to travel from place to place, and any other walking that you have done solely for recreation, sport, exercise, or leisure.</p>'
@description5 = '<p>For the following questions we would like you to consider how much time you spent sitting over the last 7 days.</p>'
@description6 = '<p>Please estimate the <u>average</u> time you spent SITTING <u>each</u> day in the following specific situations:</p>'
@description7 = '<p>The next two questions ask you to rate the amount of time you were <u>able</u> to handle certain parts of your job without difficulty.</p>'
@description8 = '<p>This question asks about difficulties you may have had at work.</p>'
@description9 = '<p>The next question asks about difficulties in relation to the people you came in contact with while working. These may include employers, supervisors, coworkers, clients, customers, or the public.</p>'
@description10 = '<p>These questions ask about how things went at work overall.</p>'
@description11 = '<p>The following 2 questions are about activities you might do during a typical day. Does your health now limit you in these activities?</p>'
@description12 = '<p>The last 4 questions are about how you feel and how things have been with you during the past 12 weeks. For each question, give the one answer that comes closest to the way you have been feeling.</p>'


####### Section 1 Questions

question1 = SurveyQuestion.find_or_create_by_name({:name => 'Question1',:question=>'How old are you?',:description=>@description,:question_type => 'TEXT'}, :without_protection => true)
question1.save
baselinesurvey.survey_questions <<  question1;
section1.survey_questions <<  question1;
question1.survey_section = section1

question0.next_question_id = question1.id;
question1.previous_question_id = question0.id;

question2 = SurveyQuestion.find_or_create_by_name({:name => 'Question2',:question=>'Are you...',:description=>@description,:question_type => 'GENDER'}, :without_protection => true)
question2.save
baselinesurvey.survey_questions <<  question2;
section1.survey_questions <<  question2;
question2.survey_section = section1
question1.next_question_id = question2.id;
question2.previous_question_id = question1.id;

question3 = SurveyQuestion.find_or_create_by_name({:name => 'Question3',:question=>'How much do you weigh (wearing light clothing and no shoes)?',:description=>@description,:question_type => 'WEIGHT'}, :without_protection => true)
question3.save
baselinesurvey.survey_questions <<  question3;
section1.survey_questions <<  question3;
question3.survey_section = section1
question2.next_question_id = question3.id;
question3.previous_question_id = question2.id;

question4 = SurveyQuestion.find_or_create_by_name({:name => 'Question4',:question=>'How tall are you (wearing no shoes)?',:description=>@description,:question_type => 'HEIGHT'}, :without_protection => true)
question4.save
baselinesurvey.survey_questions <<  question4;
section1.survey_questions <<  question4;
question4.survey_section = section1
question3.next_question_id = question4.id;
question4.previous_question_id = question3.id;

question5 = SurveyQuestion.find_or_create_by_name({:name => 'Question5',:question=>'What is the highest level of education you have completed?',:description=>@description,:question_type => 'EDUCATION'}, :without_protection => true)
question5.save
baselinesurvey.survey_questions <<  question5;
section1.survey_questions <<  question5;
question5.survey_section = section1
question4.next_question_id = question5.id;
question5.previous_question_id = question4.id;

question0.save
question1.save
question2.save
question3.save
question4.save




####### Section 2



question5.next_question_id = question20.id;
question20.previous_question_id = question5.id;
question5.save

question21 = SurveyQuestion.find_or_create_by_name({:name => 'Question21',:question=>'During the last 7 days, on how many days did you do vigorous physical activities like heavy lifting, digging, aerobics, or fast bicycling?',:description=>@description2,:question_type => 'DAYSPERWEEKV'}, :without_protection => true)
question21.save
baselinesurvey.survey_questions <<  question21;
section2.survey_questions <<  question21;
question21.survey_section = section2

question20.next_question_id = question21.id;
question21.previous_question_id = question20.id;

question22 = SurveyQuestion.find_or_create_by_name({:name => 'Question22',:question=>'How much time did you usually spend doing vigorous physical activities on one of those days?',:description=>@description2,:question_type => 'MINUTESPERDAY'}, :without_protection => true)
question22.save
baselinesurvey.survey_questions <<  question22;
section2.survey_questions <<  question22;
question22.survey_section = section2
question21.next_question_id = question22.id;
question22.previous_question_id = question21.id;

question23 = SurveyQuestion.find_or_create_by_name({:name => 'Question23',:question=>'If your pattern of activity varies from day to day, how much total time did you spend over the last 7 days doing vigorous physical activity?',:description=>@description2,:question_type => 'DAYSPERWEEK'}, :without_protection => true)
question23.save
baselinesurvey.survey_questions <<  question23;
section2.survey_questions <<  question23;
question23.survey_section = section2
question22.next_question_id = question23.id;
question23.previous_question_id = question22.id;

question20.save
question21.save
question22.save



question24 = SurveyQuestion.find_or_create_by_name({:name => 'Question24',:question=>'During the last 7 days, on how many days did you do moderate physical activities like carrying light loads, bicycling at a regular pace, or doubles tennis?  Do not include walking.',:description=>@description3,:question_type => 'DAYSPERWEEKM'}, :without_protection => true)
question24.save
baselinesurvey.survey_questions <<  question24;
section2.survey_questions <<  question24;
question24.survey_section = section2

question23.next_question_id = question24.id;
question24.previous_question_id = question23.id;

question23.save

question25 = SurveyQuestion.find_or_create_by_name({:name => 'Question25',:question=>'How much time did you usually spend doing moderate physical activities on one of those days?',:description=>@description3,:question_type => 'MINUTESPERDAY'}, :without_protection => true)
question25.save
baselinesurvey.survey_questions <<  question25;
section2.survey_questions <<  question25;
question25.survey_section = section2
question24.next_question_id = question25.id;
question25.previous_question_id = question24.id;

question26 = SurveyQuestion.find_or_create_by_name({:name => 'Question26',:question=>'If your pattern of activity varies from day to day or includes multiple tasks, how much total time did you spend <b>over the last 7 days</b> doing moderate physical activity?',:description=>@description3,:question_type => 'MINUTESPERDAY'}, :without_protection => true)
question26.save
baselinesurvey.survey_questions <<  question26;
section2.survey_questions <<  question26;
question26.survey_section = section2
question25.next_question_id = question26.id;
question26.previous_question_id = question25.id;

question24.save
question25.save
question26.save

question21.skip_to_question_id = question24.id
question21.save

question27 = SurveyQuestion.find_or_create_by_name({:name => 'Question27',:question=>'During the <b>last 7 days</b>, on how many days did you <b>walk</b> for <u>at least 10 minutes at a time?</u>',:description=>@description4,:question_type => 'DAYSPERWEEKW'}, :without_protection => true)
question27.save
baselinesurvey.survey_questions <<  question27;
section2.survey_questions <<  question27;
question27.survey_section = section2

question26.next_question_id = question27.id;
question27.previous_question_id = question26.id;
question26.save
question28 = SurveyQuestion.find_or_create_by_name({:name => 'Question28',:question=>'How much time did you usually spend walking on one of those days?',:description=>@description4,:question_type => 'MINUTESPERDAY'}, :without_protection => true)
question28.save
baselinesurvey.survey_questions <<  question28;
section2.survey_questions <<  question28;
question28.survey_section = section2
question27.next_question_id = question28.id;
question28.previous_question_id = question27.id;

question29 = SurveyQuestion.find_or_create_by_name({:name => 'Question29',:question=>'If your pattern of activity varies from day to day or includes multiple tasks, how much total time did you spend over the last 7 days walking?',:description=>@description4,:question_type => 'MINUTESPERDAY'}, :without_protection => true)
question29.save
baselinesurvey.survey_questions <<  question29;
section2.survey_questions <<  question29;
question29.survey_section = section2
question28.next_question_id = question29.id;
question29.previous_question_id = question28.id;
question29.next_question_id = question30.id;
question27.save
question28.save
question29.save

question24.skip_to_question_id = question27.id
question24.save

### section 3



question31 = SurveyQuestion.find_or_create_by_name({:name => 'Question31',:question=>'During the last 7 days, how much time did you spend sitting each day?<br>On a work day:',:description=>@description5,:question_type => 'MINUTESPERDAY'}, :without_protection => true)
question31.save
baselinesurvey.survey_questions <<  question31;
section3.survey_questions <<  question31;
question31.survey_section = section3

question27.skip_to_question_id = question31.id
question27.save

question31.previous_question_id = question30.id;

question30.next_question_id = question31.id;
question30.previous_question_id = question29.id;
question30.save

question32 = SurveyQuestion.find_or_create_by_name({:name => 'Question32',:question=>'During the last 7 days, how much time did you spend sitting each day?<br>On a non-workday:',:description=>@description5,:question_type => 'MINUTESPERDAY'}, :without_protection => true)
question32.save
baselinesurvey.survey_questions <<  question32;
section3.survey_questions <<  question32;
question32.survey_section = section3
question31.next_question_id = question32.id;
question32.previous_question_id = question21.id;

question33 = SurveyQuestion.find_or_create_by_name({:name => 'Question33',:question=>'On a work day:<br>a)  While travelling to and from places',:description=>@description6,:question_type => 'MINUTESPERDAY'}, :without_protection => true)
question33.save
baselinesurvey.survey_questions <<  question33;
section3.survey_questions <<  question33;
question33.survey_section = section3
question32.next_question_id = question33.id;
question33.previous_question_id = question32.id;

question31.save
question32.save
question33.save

question34 = SurveyQuestion.find_or_create_by_name({:name => 'Question34',:question=>'On a work day:<br>b)  At your work desk',:description=>@description6,:question_type => 'MINUTESPERDAY'}, :without_protection => true)
question34.save
baselinesurvey.survey_questions <<  question34;
section3.survey_questions <<  question34;
question34.survey_section = section3
question33.next_question_id = question34.id;
question34.previous_question_id = question33.id;
question33.save
question35 = SurveyQuestion.find_or_create_by_name({:name => 'Question35',:question=>'On a work day:<br>c)  While watching television',:description=>"",:question_type => 'MINUTESPERDAY'}, :without_protection => true)
question35.save
baselinesurvey.survey_questions <<  question35;
section3.survey_questions <<  question35;
question35.survey_section = section3
question34.next_question_id = question35.id;
question35.previous_question_id = question34.id;

question36 = SurveyQuestion.find_or_create_by_name({:name => 'Question36',:question=>'On a non-work day:<br>a)  While travelling to and from places',:description=>"",:question_type => 'MINUTESPERDAY'}, :without_protection => true)
question36.save
baselinesurvey.survey_questions <<  question36;
section3.survey_questions <<  question36;
question36.survey_section = section3
question35.next_question_id = question36.id;
question36.previous_question_id = question35.id;

question37 = SurveyQuestion.find_or_create_by_name({:name => 'Question37',:question=>'On a non-work day:<br>b)  While watching television',:description=>"",:question_type => 'MINUTESPERDAY'}, :without_protection => true)
question37.save
baselinesurvey.survey_questions <<  question37;
section3.survey_questions <<  question37;
question37.survey_section = section3
question36.next_question_id = question37.id;
question37.previous_question_id = question36.id;

question40.previous_question_id = question37.id
question37.next_question_id = question40.id

question34.save
question35.save
question36.save
question37.save


#### section 4





question41 = SurveyQuestion.find_or_create_by_name({:name => 'Question41',:question=>'How would you describe your work? Choose one of the following answers',:description=>"",:question_type => 'JOBTYPE'}, :without_protection => true)
question41.save
baselinesurvey.survey_questions <<  question41;
section4.survey_questions <<  question41;
question41.survey_section = section4

question40.next_question_id = question41.id;
question41.previous_question_id = question40.id;

question42 = SurveyQuestion.find_or_create_by_name({:name => 'Question42',:question=>'Do you work...',:description=>"",:question_type => 'JOBTIME'}, :without_protection => true)
question42.save
baselinesurvey.survey_questions <<  question42;
section4.survey_questions <<  question42;
question42.survey_section = section4
question41.next_question_id = question42.id;
question42.previous_question_id = question41.id;

question43 = SurveyQuestion.find_or_create_by_name({:name => 'Question43',:question=>'On average, how many days do you work per week?',:description=>"",:question_type => 'DAYSPERWEEK'}, :without_protection => true)
question43.save
baselinesurvey.survey_questions <<  question43;
section4.survey_questions <<  question43;
question43.survey_section = section4
question42.next_question_id = question43.id;
question43.previous_question_id = question42.id;

question40.save
question41.save
question42.save
question43.save


question44 = SurveyQuestion.find_or_create_by_name({:name => 'Question44',:question=>'On average, how many hours do you typically work per day?',:description=>"",:question_type => 'HOURSPERDAY'}, :without_protection => true)
question44.save
baselinesurvey.survey_questions <<  question44;
section4.survey_questions <<  question44;
question44.survey_section = section4

question43.next_question_id = question44.id;
question44.previous_question_id = question43.id;
question43.save
question45 = SurveyQuestion.find_or_create_by_name({:name => 'Question45',:question=>'On average, how active do you think you are during your working day? Choose one of the following answers:',:description=>"",:question_type => 'ACTIVITYLEVEL'}, :without_protection => true)
question45.save
baselinesurvey.survey_questions <<  question45;
section4.survey_questions <<  question45;
question45.survey_section = section4
question44.next_question_id = question45.id;
question45.previous_question_id = question44.id;

question46 = SurveyQuestion.find_or_create_by_name({:name => 'Question46',:question=>'Does your journey to and from work involve any active transport (i.e., walking, running, cycling, or a combination of these activities for 10 minutes or more)?',:description=>"",:question_type => 'YESNOSKIP'}, :without_protection => true)
question46.save
baselinesurvey.survey_questions <<  question46;
section4.survey_questions <<  question46;
question46.survey_section = section4
question45.next_question_id = question46.id;
question46.previous_question_id = question45.id;

question44.save
question45.save
question46.save


question47 = SurveyQuestion.find_or_create_by_name({:name => 'Question47',:question=>'How many minutes do you spend each day being active during your journey to and from work?',:description=>"",:question_type => 'MINUTESPERDAY'}, :without_protection => true)
question47.save
baselinesurvey.survey_questions <<  question47;
section4.survey_questions <<  question47;
question47.survey_section = section4

question46.next_question_id = question47.id;
question47.previous_question_id = question46.id;
question46.save

question47.next_question_id = question401.id;
question401.previous_question_id = question47.id

question48 = SurveyQuestion.find_or_create_by_name({:name => 'Question48',:question=>'In the past 2 weeks, how much of the time did your physical health or emotional problems make it difficult for you to get going easily at the beginning of the workday?',:description=>"",:question_type => 'JOBDIFFICULT'}, :without_protection => true)
question48.save
baselinesurvey.survey_questions <<  question48;
section4.survey_questions <<  question48;
question48.survey_section = section4

question401.next_question_id = question48.id;
question48.previous_question_id = question401.id;



question49 = SurveyQuestion.find_or_create_by_name({:name => 'Question49',:question=>'In the past 2 weeks, how much of the time did your physical health or emotional problems make it difficult for you to start your job as soon as you arrived at work?',:description=>"",:question_type => 'JOBDIFFICULT'}, :without_protection => true)
question49.save
baselinesurvey.survey_questions <<  question49;
section4.survey_questions <<  question49;
question49.survey_section = section4
question48.next_question_id = question49.id;
question49.previous_question_id = question48.id;

question47.save
question48.save
question49.save
question401.save

question46.skip_to_question_id = question401.id
question46.save

question410 = SurveyQuestion.find_or_create_by_name({:name => 'Question410',:question=>'In the past 2 weeks, how much of the time were you able to sit, stand, or stay in one position for longer than 15 minutes while working, without difficulty caused by physical health or emotional problems?',:description=>@description7,:question_type => 'JOBCOMPLETION'}, :without_protection => true)
question410.save
baselinesurvey.survey_questions <<  question410;
section4.survey_questions <<  question410;
question410.survey_section = section4

question49.next_question_id = question410.id;
question410.previous_question_id = question49.id;
question49.save
question411 = SurveyQuestion.find_or_create_by_name({:name => 'Question411',:question=>'In the past 2 weeks, how much of the time were you able to repeat the same motions over and over again while working, without difficulty caused by physical health or emotional problems?',:description=>@description7,:question_type => 'JOBCOMPLETION'}, :without_protection => true)
question411.save
baselinesurvey.survey_questions <<  question411;
section4.survey_questions <<  question411;
question411.survey_section = section4

question410.next_question_id = question411.id;
question411.previous_question_id = question410.id;

question410.save

question412 = SurveyQuestion.find_or_create_by_name({:name => 'Question412',:question=>'In the past 2 weeks, how much of the time did your physical health or emotional problems make it difficult for you to concentrate on your work?',:description=>@description8,:question_type => 'JOBDIFFICULT'}, :without_protection => true)
question412.save
baselinesurvey.survey_questions <<  question412;
section4.survey_questions <<  question412;
question412.survey_section = section4
question411.next_question_id = question412.id;
question412.previous_question_id = question411.id;

question413 = SurveyQuestion.find_or_create_by_name({:name => 'Question413',:question=>'In the past 2 weeks, how much of the time did your physical health or emotional problems make it difficult for you to speak with people in-person, in meetings, or on the phone?',:description=>@description9,:question_type => 'JOBDIFFICULT'}, :without_protection => true)
question413.save
baselinesurvey.survey_questions <<  question413;
section4.survey_questions <<  question413;
question413.survey_section = section4
question412.next_question_id = question413.id;
question413.previous_question_id = question412.id;

question410.save
question411.save
question412.save
question413.save


question414 = SurveyQuestion.find_or_create_by_name({:name => 'Question414',:question=>'In the past 2 weeks, how much of the time did your physical health or emotional problems make it difficult for you to handle the workload?',:description=>@description9,:question_type => 'JOBDIFFICULT'}, :without_protection => true)
question414.save
baselinesurvey.survey_questions <<  question414;
section4.survey_questions <<  question414;
question414.survey_section = section4

question413.next_question_id = question414.id;
question414.previous_question_id = question413.id;

question413.save

question415 = SurveyQuestion.find_or_create_by_name({:name => 'Question415',:question=>'In the past 2 weeks, how much of the time did your physical health or emotional problems make it difficult for you to finish work on time?',:description=>@description9,:question_type => 'JOBDIFFICULT'}, :without_protection => true)
question415.save
baselinesurvey.survey_questions <<  question415;
section4.survey_questions <<  question415;
question415.survey_section = section4
question414.next_question_id = question415.id;
question415.previous_question_id = question414.id;


question415.next_question_id = question50.id;
question50.previous_question_id = question415.id;
question414.save
question415.save




#### section 5


question51 = SurveyQuestion.find_or_create_by_name({:name => 'question51',:question=>'In general, would you say your health is:',:description=>"",:question_type => 'HEALTH'}, :without_protection => true)
question51.save
baselinesurvey.survey_questions <<  question51;
section5.survey_questions <<  question51;
question51.survey_section = section5

question50.next_question_id = question51.id;
question50.save

question51.previous_question_id = question50.id;



question52 = SurveyQuestion.find_or_create_by_name({:name => 'question52',:question=>'Moderate activities such as moving a table, pushing a vacuum cleaner, bowling or playing golf. If so, how much?',:description=>@description10,:question_type => 'ACTIVITYLIMIT'}, :without_protection => true)
question52.save
baselinesurvey.survey_questions <<  question52;
section5.survey_questions <<  question52;
question52.survey_section = section5
question51.next_question_id = question52.id;
question52.previous_question_id = question51.id;

question53 = SurveyQuestion.find_or_create_by_name({:name => 'question53',:question=>'Climbing several flights of stairs. If so, how much?',:description=>"",:question_type => 'ACTIVITYLIMIT'}, :without_protection => true)
question53.save
baselinesurvey.survey_questions <<  question53;
section5.survey_questions <<  question53;
question53.survey_section = section5
question52.next_question_id = question53.id;
question53.previous_question_id = question52.id;

question50.save
question51.save
question52.save
question53.save


question54 = SurveyQuestion.find_or_create_by_name({:name => 'question54',:question=>'During the past 12 weeks, have you accomplished less than you would like as a result of your physical health?',:description=>"",:question_type => 'YESNO'}, :without_protection => true)
question54.save
baselinesurvey.survey_questions <<  question54;
section5.survey_questions <<  question54;
question54.survey_section = section5

question53.next_question_id = question54.id;
question54.previous_question_id = question53.id;

question53.save

question55 = SurveyQuestion.find_or_create_by_name({:name => 'question55',:question=>'During the past 12 weeks, were you limited in the kind of work or other regular activities you do as a result of your physical health?',:description=>"",:question_type => 'YESNO'}, :without_protection => true)
question55.save
baselinesurvey.survey_questions <<  question55;
section5.survey_questions <<  question55;
question55.survey_section = section5
question54.next_question_id = question55.id;
question55.previous_question_id = question54.id;

question56 = SurveyQuestion.find_or_create_by_name({:name => 'question56',:question=>'During the past 12 weeks, have you accomplished less than you would like to as a result of any emotional problems, such as feeling depressed or anxious?',:description=>"",:question_type => 'YESNO'}, :without_protection => true)
question56.save
baselinesurvey.survey_questions <<  question56;
section5.survey_questions <<  question56;
question56.survey_section = section5
question55.next_question_id = question56.id;
question56.previous_question_id = question55.id;

question54.save
question55.save



question57 = SurveyQuestion.find_or_create_by_name({:name => 'question57',:question=>'During the past 12 weeks, did you not do work or other regular activities as carefully as usual as a result of any emotional problems such as feeling depressed or anxious?',:description=>"",:question_type => 'YESNO'}, :without_protection => true)
question57.save
baselinesurvey.survey_questions <<  question57;
section5.survey_questions <<  question57;
question57.survey_section = section5

question56.next_question_id = question57.id;
question57.previous_question_id = question56.id;


question56.save


question58 = SurveyQuestion.find_or_create_by_name({:name => 'question58',:question=>'How many hours (0-8) in a typical 8-hour work day does back pain interfere with accomplishing tasks at work?',:description=>"",:question_type => 'TEXT'}, :without_protection => true)
question58.save
baselinesurvey.survey_questions <<  question58;
section5.survey_questions <<  question58;
question58.survey_section = section5

question57.next_question_id = question58.id;
question58.previous_question_id = question57.id;

question59 = SurveyQuestion.find_or_create_by_name({:name => 'question59',:question=>'How many hours (0-8) in a typical 8-hour work day does depression or anxiety interfere with accomplishing tasks at work?',:description=>"",:question_type => 'TEXT'}, :without_protection => true)
question59.save
baselinesurvey.survey_questions <<  question59;
section5.survey_questions <<  question59;
question59.survey_section = section5
question58.next_question_id = question59.id;
question59.previous_question_id = question58.id;

question57.save
question58.save
question59.save

question510 = SurveyQuestion.find_or_create_by_name({:name => 'question510',:question=>'During the past 12 weeks, how much did physical pain interfere with your normal work, including both work outside the home or housework?',:description=>"",:question_type => 'CONCENTRATION'}, :without_protection => true)
question510.save
baselinesurvey.survey_questions <<  question510;
section5.survey_questions <<  question510;
question510.survey_section = section5

question59.next_question_id = question510.id;
question510.previous_question_id = question59.id;
question59.save
question511 = SurveyQuestion.find_or_create_by_name({:name => 'question511',:question=>'During the past 12 weeks, how much difficulty did you have concentrating at work and accomplishing tasks because of physical or emotional problems?',:description=>"",:question_type => 'CONCENTRATION'}, :without_protection => true)
question511.save
baselinesurvey.survey_questions <<  question511;
section5.survey_questions <<  question511;
question511.survey_section = section5

question510.next_question_id = question511.id;
question511.previous_question_id = question510.id;

question512 = SurveyQuestion.find_or_create_by_name({:name => 'question512',:question=>'How much time during the past 12 weeks have you felt down?',:description=>@description11,:question_type => 'FEELING'}, :without_protection => true)
question512.save
baselinesurvey.survey_questions <<  question512;
section5.survey_questions <<  question512;
question512.survey_section = section5
question511.next_question_id = question512.id;
question512.previous_question_id = question511.id;

question513 = SurveyQuestion.find_or_create_by_name({:name => 'question513',:question=>'During the past 12 weeks, how much of the time has your physical health or emotional problems interfered with your social activities like visiting with friends, relatives etc.?',:description=>"",:question_type => 'FEELING'}, :without_protection => true)
question513.save
baselinesurvey.survey_questions <<  question513;
section5.survey_questions <<  question513;
question513.survey_section = section5
question512.next_question_id = question513.id;
question513.previous_question_id = question512.id;

question510.save
question511.save
question512.save
question513.save


question514 = SurveyQuestion.find_or_create_by_name({:name => 'question514',:question=>'How much time during the past 12 weeks have you felt calm and peaceful?',:description=>"",:question_type => 'FEELING'}, :without_protection => true)
question514.save
baselinesurvey.survey_questions <<  question514;
section5.survey_questions <<  question514;
question514.survey_section = section5

question513.next_question_id = question514.id;
question514.previous_question_id = question513.id;
question513.save
question515 = SurveyQuestion.find_or_create_by_name({:name => 'question515',:question=>'How much of the time during the past 12 weeks did you have a lot of energy?',:description=>"",:question_type => 'FEELING'}, :without_protection => true)
question515.save
baselinesurvey.survey_questions <<  question515;
section5.survey_questions <<  question515;
question515.survey_section = section5
question514.next_question_id = question515.id;
question515.previous_question_id = question514.id;

question514.save
question515.save