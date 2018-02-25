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

study = Study.find_or_create_by_name({ :name => 'RiseAtWork',:duration_in_days => '12'}, :without_protection => true)
puts 'study:' << study.name

phase = Phase.find_or_create_by_name({ :name => 'Baseline',:order_id => '1',:duration_in_days => '7',:start_on_day_of_study => "1", :finish_on_day_of_study=>"7", :daily_phase_goal => '0', :daily_phase_goal=>'0'}, :without_protection => true)
puts 'phase:' << phase.name
study.phases << phase
phase.description = '<p>In this first week, you will be collecting baseline data about how many steps you usually take each day and over a week. Don&#39t change your usual routine.  This information will then be used to provide you with individualized goals to ramp up your steps over the next ten weeks. </p><p> Check in once a day to log your steps. Find a time that works best for you so you can get in the habit of monitoring your daily steps.  For example, you could enter the previous day&#39s steps first thing when you get to work. Or you could enter your daily steps before you shut down your computer at the end of the day.</p><p> If you miss a day or two make a note of your steps and you can still enter these within five days.</p>'
phase.study = study
phase.save
study.save

 #phase.study << study


phase2 = Phase.find_or_create_by_name({ :name => 'Phase 1',:order_id => '2',:duration_in_days => '14',:start_on_day_of_study => "8", :finish_on_day_of_study=>"21", :daily_phase_goal => '1000', :overall_phase_goal=>'14000'}, :without_protection => true)
puts 'phase:' << phase2.name

phase2.description = '<p>During this first phase of RISE@Work, try to sit less and move more whenever you can in your daily working tasks. Sitting for long periods of time can be unhealthy. In fact, if you are sitting less often and moving frequently throughout the day, you can use more energy than someone who goes to the gym but spends their whole workday seated.</p> 
<p>This phase encourages you to make small but important changes at the beginning of your program.</p>
<p>Your aim is to add 1000 steps/day to your baseline step count. Use your pedometer and the dashboard feature of this website to monitor your progress towards this target.</p>
<p>Please access your <b>support strategies</b> for tips on how to achieve your target in this phase. Download the <b>Take a Stand</b> app from the bottom of the dashboard.</p>'


study.phases<<phase2
phase2.study = study
phase2.save
study.save

 phase3 = Phase.find_or_create_by_name({ :name => 'Phase 2',:order_id => '3',:duration_in_days => '14',:start_on_day_of_study => "22", :finish_on_day_of_study=>"35", :daily_phase_goal => '2000', :overall_phase_goal=>'28000'}, :without_protection => true)
puts 'phase:' << phase3.name
phase3.description = '<p>During this second phase of RISE@Work, incorporate shorter planned walks into your daily routine. This will bring additional health and work-related benefits on top of those you have already gained from reducing the time you spend sitting each day. Shorter planned walks last for about 10 minutes and make you breathe a little harder and feel slightly warmer. </p>
<p>This phase builds on the changes you have already made to your workday and encourages you to make additional increases to your daily steps.</p>
<p>Using a combination of the new planning tool and maps tool, your step target is to now add 2000 steps/day onto your baseline step count. Use your pedometer and the dashboard feature of this website to monitor your progress towards this target.</p>
<p><p>Each ten minutes spent walking counts towards your step target and your health.</p>'
 study.phases << phase3
 phase3.study = study
 phase3.save
 study.save

 phase4 = Phase.find_or_create_by_name({ :name => 'Phase 3',:order_id => '4',:duration_in_days => '14',:start_on_day_of_study => "36", :finish_on_day_of_study=>"49", :daily_phase_goal => '3000', :overall_phase_goal=>'42000'}, :without_protection => true)
puts 'phase:' << phase4.name

 study.phases << phase4
 phase4.description = '<p>This third phase of RISE@Work challenges you to increase your step counts through a combination of walking in daily tasks and taking longer planned walks.</p>
<p>Try to make additional increases to your daily steps through extending your short walk from 10 to 20 minutes. Once again, these walks should make you breathe harder and feel warmer, but you should still be able to walk and talk comfortably.</p>
<p>Using a combination of strategies, your aim is to now add 3000 steps/day onto your baseline step count. Use your pedometer and the website dashboard to monitor your progress towards this target.</p>
<p>It is not always easy to include a 20-minute walk into each workday. Try your best to plan ahead for longer walks whenever you can by using the <b>Routes</b> tool and the <b>Action Planning</b> tool to develop strategies to overcome barriers that you may encounter.</p>'
 phase4.study = study
 phase4.save
 study.save

 phase5 = Phase.find_or_create_by_name({ :name => 'Phase 4',:order_id => '5',:duration_in_days => '14',:start_on_day_of_study => "50", :finish_on_day_of_study=>"63", :daily_phase_goal => '3000', :overall_phase_goal=>'42000'}, :without_protection => true)
puts 'phase:' << phase5.name
phase5.description = '<p>You are now in the fourth phase. Your target is to maintain 3000 steps/day over baseline using a combination of strategies.</p>
<p>Think about accumulating 3000 additional steps above baseline as a valuable minimum, and challenge yourself with how many steps you can do beyond this. Obtaining 10,000 steps/day is a recognised health target for adults. Are you close to or exceeding this daily step target? Good luck over the next two weeks!</p>'
 study.phases << phase5
 phase5.study = study
 phase5.save
 study.save

 phase6 = Phase.find_or_create_by_name({ :name => 'Phase 5',:order_id => '6',:duration_in_days => '14',:start_on_day_of_study => "64", :finish_on_day_of_study=>"77", :daily_phase_goal => '3000', :overall_phase_goal=>'42000'}, :without_protection => true)
puts 'phase:' << phase6.name

#study.phases = (phase,phase2,phase3,phase4,phase5,phase6)
phase6.description = '<p>You have successfully reached phase five, the final phase of RISE@Work.</p>
<p>Your aim for Phase 5 is to maintain an increase of at least 3000 steps/day above your baseline step count. Continue to use your pedometer, the website, Take A Stand alert app, and various tools to sustain this level of walking.</p>'
 study.phases << phase6
 phase6.study = study
 phase6.save
 study.save


#############################################
#Setup Organization
#############################################

organization = Organization.find_or_create_by_name({:name => 'Dalhousie University',:secret_key => '23572',:time_zone=>'Eastern Time (US & Canada)' }, :without_protection => true)
puts 'Organization:' << organization.name
organization.save

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
user.organization = organization
puts 'user: ' << user.name
user.confirm!
user.add_role :admin
user.save


organization.users << user
organization.save
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
phase2.strategies << strategy3

puts 'Strategy:' << strategy3.name




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
phase2.strategies << strategy5

puts 'Strategy:' << strategy5.name

strategy12 = Strategy.find_or_create_by_name({:name => 'Take a stand',:content=>'
<div class="row-fluid">
<div class="span12"> 
<p>Stand and take a break from your computer every 30 min.</p>
  </div>
  </div>'
} )
strategy12.strategy_type = 'support'
phase2.strategies << strategy12

puts 'Strategy:' << strategy12.name

strategy13 = Strategy.find_or_create_by_name({:name => 'Meeting breaks',:content=>'
<div class="row-fluid">
<div class="span12"> 
<p>Take breaks in sitting time in long meetings.</p>
  </div>
  </div>'
} )
strategy13.strategy_type = 'support'
phase2.strategies << strategy13

puts 'Strategy:' << strategy13.name



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
phase3.strategies << strategy22

puts 'Strategy:' << strategy22.name

strategy23 = Strategy.find_or_create_by_name({:name => 'Friendly greetings',:content=>'
<div class="row-fluid">
<div class="span12"> 
<p>Stand to greet a visitor to your workspace.</p>
  </div>
  </div>'
} )
strategy23.strategy_type = 'support'
phase3.strategies << strategy23

puts 'Strategy:' << strategy23.name

strategy24 = Strategy.find_or_create_by_name({:name => 'Stand to ring',:content=>'
<div class="row-fluid">
<div class="span12"> 
<p>Stand during phone calls</p>
  </div>
  </div>'
} )
strategy24.strategy_type = 'support'
phase3.strategies << strategy24

puts 'Strategy:' << strategy24.name


phase3.strategies << strategy
phase3.strategies << strategy2
phase3.strategies << strategy3
phase3.strategies << strategy5
phase3.strategies << strategy12
phase3.strategies << strategy13



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
phase4.strategies << strategy32

strategy33 = Strategy.find_or_create_by_name({:name => 'Make a date',:content=>'
<div class="row-fluid">
<div class="span12"> 
<p>Whether you want to walk with others or walk on your own, schedule it as an activity. You are more likely to stick to your good habit if it is part of your working day.
</p>

</div>

  </div>'
} )
strategy33.strategy_type = 'support'
phase4.strategies << strategy33


strategy34 = Strategy.find_or_create_by_name({:name => 'Check out a new cafe or restaurant',:content=>'
<div class="row-fluid">
<div class="span6">
<p>On your coffee or lunch break, check out a cafe or restaurant you&#39ve never been to before. Try to pick a new place every week or couple of weeks, and discover new areas around campus while you&#39re at it. For ideas on where to eat, try <a href="http://www.blogto.com/restaurants">http://www.blogto.com/restaurants</a> or, do a Google search for cafes in the neighbourhood you&#39d like to explore.</p>

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
phase4.strategies << strategy34


strategy35 = Strategy.find_or_create_by_name({:name => 'Rock while you walk',:content=>'
<div class="row-fluid">
<div class="span12"> 
<p>Bring your iPod or portable music device and listen to your favourite tunes as you walk. Make sure to pick upbeat, motivating music to energize you as you walk. Since you will be on the move, this gives you the freedom to turn up the volume a few notches as well!</p>

</div>
  </div>'
} )

strategy35.strategy_type = 'support'
phase4.strategies << strategy35

strategy36 = Strategy.find_or_create_by_name({:name => 'Walk to talk',:content=>'
<div class="row-fluid">
<div class="span12"> 
<p>Walk to your colleagues&#39 desk instead of phoning or emailing</p>
  </div>
  </div>'
} )

strategy36.strategy_type = 'support'
phase4.strategies << strategy36

strategy37 = Strategy.find_or_create_by_name({:name => 'Drink up',:content=>'
<div class="row-fluid">
<div class="span12"> 
<p>Drink more water, going to the water cooler and toilet will break up sitting time</p>
  </div>
  </div>'
} )
strategy37.strategy_type = 'support'
phase4.strategies << strategy37


phase4.strategies << strategy21
phase4.strategies << strategy22
phase4.strategies << strategy23
phase4.strategies << strategy24

phase4.strategies << strategy
phase4.strategies << strategy2
phase4.strategies << strategy3
phase4.strategies << strategy5
phase4.strategies << strategy12
phase4.strategies << strategy13

#############################################
#Strategies Phase 4 and 5
#############################################

strategy41 = Strategy.find_or_create_by_name({:name => 'Step together',:content=>'
<div class="row-fluid">
<div class="span12"> 
<p>Community walking groups are a fantastic way to increase your walking whilst meeting new people, strengthening your community connections and exploring your local area. There are many volunteer led walking groups that vary in size and are often free to be involved in.</p>
<p>A terrific resource for us here at the University of Toronto is the Organizational Development and Learning Centre. Check out <a href="http://www.utoronto.ca/hrhome/odlc/wlb/discamp.htm">www.utoronto.ca/hrhome/odlc/wlb/discamp.htm</a> for a list of guided walks right here on campus.</p>
<p>You might also try looking for a walking group near your workplace or home for weekends and evenings. Most <a href="http://www.runningroom.com">Running Room</a> locations offer running groups, for all ability levels; see if your local Running Room has a walking group-if not, talk to the manager there about starting one up!</p>
</div>
  </div>'
} )
strategy41.strategy_type = 'support'
phase5.strategies << strategy41
phase6.strategies << strategy41

strategy42 = Strategy.find_or_create_by_name({:name => 'Step up and lend a hand',:content=>'
<div class="row-fluid">
<div class="span12"> 
<p>Volunteering is a great way to help others and also keep your step count up. You can volunteer as a walk leader for a local walking group - and motivate others to be active at the same time! Are there charity organisations in your area that would appreciate your assistance? How about a local community garden to get actively involved in?</p>

</div>
  </div>'
} )
strategy42.strategy_type = 'support'
phase5.strategies << strategy42
phase6.strategies << strategy42

strategy43 = Strategy.find_or_create_by_name({:name => 'Walk@Weekends',:content=>'
<div class="row-fluid">
<div class="span12"> 
<p>Start your weekend with a morning walk. If you are meeting up with friends, take a walk together before or after sitting for lunch. Can you take an active family outing? See how many extra steps you can get while shopping at the mall or markets. Think of all your opportunities to be active beyond the workplace.</p>

</div>
  </div>'
} )
strategy43.strategy_type = 'support'
phase5.strategies << strategy43
phase6.strategies << strategy43


strategy44 = Strategy.find_or_create_by_name({:name => 'Share your stepping',:content=>'
<div class="row-fluid">
<div class="span12"> 
<p>Do you have family or friends who could share the benefits you&#39ve gained from being more active? Why not take a short walk together and help to get them involved. It&#39s also a great way to stay motivated! 
</p>

</div>
  </div>'
} )
strategy44.strategy_type = 'support'
phase5.strategies << strategy44
phase6.strategies << strategy44

strategy45 = Strategy.find_or_create_by_name({:name => 'Stand to talk',:content=>'
<div class="row-fluid">
<div class="span12"> 
<p>Use headsets or the speaker phone during teleconferences so you can stand</p>
  </div>
  </div>'
} )
strategy45.strategy_type = 'support'
phase5.strategies << strategy45
phase6.strategies << strategy45


strategy46 = Strategy.find_or_create_by_name({:name => 'Lunch take away',:content=>'
<div class="row-fluid">
<div class="span12"> 
<p>Eat your lunch away from your desk</p>
  </div>
  </div>'
} )
strategy46.strategy_type = 'support'
phase5.strategies << strategy46
phase6.strategies << strategy46

strategy47 = Strategy.find_or_create_by_name({:name => 'Stand back',:content=>'
<div class="row-fluid">
<div class="span12"> 
<p>Stand at the back of the room during presentations</p>
  </div>
  </div>'
} )
strategy47.strategy_type = 'support'
phase5.strategies << strategy47
phase6.strategies << strategy47

phase5.strategies << strategy31
phase5.strategies << strategy32
phase5.strategies << strategy33
phase5.strategies << strategy34
phase5.strategies << strategy35
phase5.strategies << strategy36
phase5.strategies << strategy37

phase5.strategies << strategy21
phase5.strategies << strategy22
phase5.strategies << strategy23
phase5.strategies << strategy24

phase5.strategies << strategy
phase5.strategies << strategy2
phase5.strategies << strategy3
phase5.strategies << strategy5
phase5.strategies << strategy12
phase5.strategies << strategy13


phase6.strategies << strategy31
phase6.strategies << strategy32
phase6.strategies << strategy33
phase6.strategies << strategy34
phase6.strategies << strategy35
phase6.strategies << strategy36
phase6.strategies << strategy37

phase6.strategies << strategy21
phase6.strategies << strategy22
phase6.strategies << strategy23
phase6.strategies << strategy24

phase6.strategies << strategy
phase6.strategies << strategy2
phase6.strategies << strategy3
phase6.strategies << strategy5
phase6.strategies << strategy12
phase6.strategies << strategy13

strategy41.save
strategy42.save
strategy43.save
strategy44.save
strategy45.save
strategy46.save
strategy47.save

strategy21.save
strategy22.save
strategy23.save
strategy24.save

strategy.save
strategy2.save
strategy3.save
strategy5.save
strategy12.save
strategy13.save

strategy31.save
strategy32.save
strategy33.save
strategy34.save
strategy35.save
strategy36.save
strategy37.save

strategy21.save
strategy22.save
strategy23.save
strategy24.save

phase.save
phase2.save
phase3.save
phase4.save
phase5.save
phase6.save



 
#############################################
#Setup Routes
#############################################

strategy6 = Strategy.find_or_create_by_name({:name => 'West Campus Loop',:content=>'
<div class="row-fluid">
<div class="span6"> 
<p>Start at the Henry Hicks Building and wander the western edge of campus around King&#39;s College.</p>

</div>
<div class="span6">
 <table id="datatable_example" class="responsive table table-striped table-bordered" style="width:100%;margin-bottom:0; ">
  <thead> <tr> <th class="">Details:</th> </tr> </thead> 
  <tbody> <tr> <td>2200 steps</td> </tr> 
  <tr> <td>20 minutes</td> </tr> 
  <tr> <td>1.8 km</td> </tr> 
  </tbody> 
  </table>
  </div>
  </div>'
} )

strategy6.strategy_type = 'route'
strategy6.strategy_subtype = 'long'
strategy6.map_image_url  = 'images/general/dal/route_1.png'
strategy6.map_url= 'http://goo.gl/maps/S94ib'

phase3.strategies << strategy6
phase4.strategies << strategy6
phase5.strategies << strategy6
phase6.strategies << strategy6
strategy6.save
puts 'Strategy:' << strategy6.name


strategy7 = Strategy.find_or_create_by_name({:name => 'The Beaufort',:content=>'
<div class="row-fluid">
<div class="span6"> 
<p>From the Student Union Building walk down South St to Beaufort Ave and enjoy the view of the Northwest Arm.</p>
</div>
<div class="span6">
 <table id="datatable_example" class="responsive table table-striped table-bordered" style="width:100%;margin-bottom:0; ">
  <thead> <tr> <th class="">Details:</th> </tr> </thead> 
  <tbody> <tr> <td>3400 steps</td> </tr> 
  <tr> <td>30 minutes</td> </tr> 
  <tr> <td>2.6 km</td> </tr> 
  </tbody> 
  </table>
  </div>
  </div>'
} )

strategy7.strategy_type = 'route'
strategy7.strategy_subtype = 'long'
strategy7.map_image_url  = 'images/general/dal/route_2.png'
strategy7.map_url= 'http://goo.gl/maps/Ihx2g'

phase3.strategies << strategy7
phase4.strategies << strategy7
phase5.strategies << strategy7
phase6.strategies << strategy7
strategy7.save
puts 'Strategy:' << strategy7.name

strategy8 = Strategy.find_or_create_by_name({:name => 'South End Walk',:content=>'
<div class="row-fluid">
<div class="span6"> 
<p>Walk from University Ave around St Mary&#39;s University to the historic Point Pleasant Park and back.</p>
</div>
<div class="span6">
 <table id="datatable_example" class="responsive table table-striped table-bordered" style="width:100%;margin-bottom:0; ">
  <thead> <tr> <th class="">Details:</th> </tr> </thead> 
  <tbody> <tr> <td>5800 steps</td> </tr> 
  <tr> <td>50 minutes</td> </tr> 
  <tr> <td>4.4 km</td> </tr> 
  </tbody> 
  </table>
  </div>
  </div>'
} )

strategy8.strategy_type = 'route'
strategy8.strategy_subtype = 'long'
strategy8.map_image_url  = 'images/general/dal/route_3.png'
strategy8.map_url= 'http://goo.gl/maps/YfBKI'

phase3.strategies << strategy8
phase4.strategies << strategy8
phase5.strategies << strategy8
phase6.strategies << strategy8
strategy8.save
puts 'Strategy:' << strategy8.name


strategy9 = Strategy.find_or_create_by_name({:name => 'East Campus Loop',:content=>'
<div class="row-fluid">
<div class="span6"> 
<p>Enjoy a walk through the heart of campus starting and ending at the Arts Centre.</p>
</div>
<div class="span6">
 <table id="datatable_example" class="responsive table table-striped table-bordered" style="width:100%;margin-bottom:0; ">
  <thead> <tr> <th class="">Details:</th> </tr> </thead> 
  <tbody> <tr> <td>2100 steps</td> </tr> 
  <tr> <td>17 minutes</td> </tr> 
  <tr> <td>1.6 km</td> </tr> 
  </tbody> 
  </table>
  </div>
  </div>'
} )

strategy9.strategy_type = 'route'
strategy9.strategy_subtype = 'short'
strategy9.map_image_url  = 'images/general/dal/route_4.png'
strategy9.map_url= 'http://goo.gl/maps/pyz2N'

phase3.strategies << strategy9
phase4.strategies << strategy9
phase5.strategies << strategy9
phase6.strategies << strategy9
strategy9.save
puts 'Strategy:' << strategy9.name

strategy10 = Strategy.find_or_create_by_name({:name => 'University Ave Walk',:content=>'
<div class="row-fluid">
<div class="span6"> 
<p>Make a quick trip up and down University Ave for a little relaxation.</p>
</div>
<div class="span6">
 <table id="datatable_example" class="responsive table table-striped table-bordered" style="width:100%;margin-bottom:0; ">
  <thead> <tr> <th class="">Details:</th> </tr> </thead> 
  <tbody> <tr> <td>1100 steps</td> </tr> 
  <tr> <td>10 minutes</td> </tr> 
  <tr> <td>830 m</td> </tr> 
  </tbody> 
  </table>
  </div>
  </div>'
} )

strategy10.strategy_type = 'route'
strategy10.strategy_subtype = 'short'
strategy10.map_image_url  = 'images/general/dal/route_5.png'
strategy10.map_url= 'http://goo.gl/maps/DCd77'

phase3.strategies << strategy10
phase4.strategies << strategy10
phase5.strategies << strategy10
phase6.strategies << strategy10
strategy10.save
puts 'Strategy:' << strategy10.name

strategy11 = Strategy.find_or_create_by_name({:name => 'Park Walk',:content=>'
<div class="row-fluid">
<div class="span6"> 
<p>Take in the sights and sounds as you walk along Victoria Park and the Halifax Public Gardens.</p>
</div>
<div class="span6">
 <table id="datatable_example" class="responsive table table-striped table-bordered" style="width:100%;margin-bottom:0; ">
  <thead> <tr> <th class="">Details:</th> </tr> </thead> 
  <tbody> <tr> <td>1800 steps</td> </tr> 
  <tr> <td>15 minutes</td> </tr> 
  <tr> <td>1.4 km</td> </tr> 
  </tbody> 
  </table>
  </div>
  </div>'
} )

strategy11.strategy_type = 'route'
strategy11.strategy_subtype = 'short'
strategy11.map_image_url  = 'images/general/dal/route_6.png'
strategy11.map_url= 'http://goo.gl/maps/ejf2W'

phase3.strategies << strategy11
phase4.strategies << strategy11
phase5.strategies << strategy11
phase6.strategies << strategy11
strategy11.save
puts 'Strategy:' << strategy11.name


#############################################
#Setup Artciles
#############################################

article = Article.find_or_create_by_name({ :name => 'What is RISE@Work?', :content=>'<p>RISE@Work is a brand new, innovative and interactive web application and research platform designed to assist Canadian employees to reduce their sitting time and increase their physical activity. </p><p> Sedentary behaviour, in particular sitting time, is an emerging public health concern associated with an increased risk of chronic diseases. Studies show that Canadian adults are sedentary for 9.5 hours per day (approximately 69% of their waking hours), with many adults spending up to one-half of their work day sitting. In addition, only 15% of adults are currently meeting the Canadian Physical Activity Guidelines for Adults that recommends 150 minutes of moderate to vigorous physical activity each week. </p>' }, :without_protection => true)
puts 'Article:' << article.name

article = Article.find_or_create_by_name({ :name => 'Who We Are', :content=>'<p>The RISE@Work team is based in the Faculty of Health Professions, School of Health and Human Performance and School of Physiotherapy, at Dalhousie University. The RISE@Work team is also affiliated with colleagues from the Faculty of Kinesiology and Physical Education, University of Toronto.' }, :without_protection => true)
puts 'Article:' << article.name

article = Article.find_or_create_by_name({ :name => 'Why join RISE@Work?', :content=>'<p> Over the course of this 11-week intervention, you will learn a variety of practical and easy-to-use strategies to reduce the time that you spend sitting at your desk and increase the number of steps that you take in a day. These strategies are based on extensive research in how to change and maintain healthy behaviours and have been developed by the RISE@Work team.</p>' }, :without_protection => true)
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

article = Article.find_or_create_by_name({ :name => 'About Us', :content=>'<p>The RISE@Work team is based in the Faculty of Health Professions, School of Health and Human Performance and School of Physiotherapy, at Dalhousie University. The RISE@Work team is also affiliated with colleagues from the Faculty of Kinesiology and Physical Education, University of Toronto. </p><h4>Primary Investigator:<strong> Dr. Michelle Stone</strong></h4><p>Dr. Stone is an Assistant Professor in the School of Health and Human Performance at Dalhousie University. She has expertise in accelerometry-based physical activity (PA) measurement (<a href="http://www.dal.ca/faculty/healthprofessions/health-humanperformance/faculty-staff/our-faculty/kinesiology/michelle-stone.html" target="_blank">see here</a>). Her main interests are in pursuing behavioural and interventional research in PA and sedentary behaviour, health and chronic disease prevention. As the Principal Investigator, Dr. Stone will coordinate and lead the implementation of RISE@Work at Dalhousie University. Her contact details are: <a href=&#34;mailto:michelle.stone@dal.ca&#34; target=&#34;_blank&#34;>michelle.stone@dal.ca</a></p><h4> Co-Investigator:<strong> Dr. Anne Fenety</strong></h4><p>Dr. Fenety is an Assistant Professor and Director of the School of Physiotherapy at Dalhousie University. Dr. Fenety&#39;s primary ergonomic and physiotherapy research relates to the measurement of sitting behavior and the prevention of work-related musculoskeletal (MSK) disorders in seated computer operators.</p><h4>Co-Investigator:<strong> Dr. Melanie Keats</strong></h4><p>Dr. Keats is an Associate Professor in the School of Health and Human Performance (Kinesiology) at Dalhousie University. Her research interests include the examination of the impact of PA on health outcomes; investigating the prevalence, determinants, and activity preferences of individuals with chronic illness, and exploring the effectiveness of novel interventions designed to promote PA with at risk populations.</p><h4>Co-Investigator:<strong> Dr. Daniel Stevens</strong></h4><p>Dr. Stevens is an Assistant Professor in the School of Health and Human Performance and the Department of Pediatrics, Faculty of Medicine, at Dalhousie University. His research interests and training are in exercise and respiratory physiology, and sleep medicine. His work has investigated exercise limitations in both pediatric and adult populations with cardiorespiratory diseases, causes and consequences of sleep disordered breathing, and relationships between exercise, physical activity and sleep measures.</p><h4>Co-Investigator:<strong> Dr. Guy Faulkner</strong></h4><p>Dr. Faulkner is a Professor in exercise and health psychology in the Faculty of Kinesiology and Physical Education at the University of Toronto. Dr. Faulkner is the Principal Investigator of RISE@Work at the University of Toronto site.</p><h4>Co-Investigator: <strong>Dr. Kelly Arbour-Nicitopoulos</strong></h4><p>Dr. Arbour-Nicitopoulos is an Assistant Professor in the Faculty of Kinesiology and Physical Education at the University of Toronto. Dr. Arbour-Nicitopoulos is a co-investigator of RISE@Work at the University of Toronto site. </p><h4>Research Coordinator: <strong>Dr. Subha Ramanathan</strong
  ></h4><p>Dr. Subha Ramanathan&#39;s expertise is in examining physical activity participation from community and public health perspectives.</p>'}, :without_protection => true)
puts 'Article:' << article.name

article = Article.find_or_create_by_name({ :name => 'EUA', :content=>
'RISE@Work Participant Information

I have read and understand the participant information provided to me concerning this initiative and I agree to participate in the RISE@Work study.

I understand that:
- Taking part in the study involves participation in an 11 week workplace sitting time reduction program using a website and collection of physical activity data (pedometer and accelerometer).
- Strategies for reducing sitting time in the workplace will be provided to me via the RISE@Work web-based platform.
- Throughout the program, I will be asked to wear a pedometer and record my step count during my working day on the RISE@Work web-based platform.
- I will be asked to wear an accelerometer for eight (8) consecutive days at the beginning and end of the program, so that the research team is able to obtain more detailed information on my physical activity and inactivity patterns (i.e., the amount of time I spend sitting vs. in light or moderate intensity activity per day).
- I will be asked to complete an online questionnaire that asks about my health and wellbeing, physical activity participation, sitting time, work productivity at the beginning and end of the study, and two paper questionnaires that assess daytime sleepiness at the beginning, mid-way, and end of the study.
- I will also be asked to complete a short body discomfort rating scale once per week during the 11 week study.
- During and following the study, I may be asked by researchers to report on my experiences and perceptions regarding the RISE@Work program.
- Participation in this study is voluntary. I can withdraw from the study at any time without penalty by informing the RISE@Work research team (contact details below) and do not have to give reasons for withdrawing.
- All information will be confidential, using unique participant ID codes and web-site log-in details, and only anonymous summary data will be reported. The data collected may be published in such a way that my name is not used, and that I cannot be identified in any way. Anonymous data will be stored at Dalhousie University and at the University of Toronto.'
}, :without_protection => true)
puts 'Article:' << article.name

homedashboard = HomeDashboard.find_or_create_by_home_dashboard_id({ :home_dashboard_id => '1', :people_walking =>'0',:steps_taken_daily=>'0', :steps_increasing_weekly=>'0', :total_steps_taken=>'0',:total_days_of_activity=>'0' }, :without_protection => true)
puts 'HomeDashboard:' << homedashboard.home_dashboard_id
############################################



#############################################
#Setup Action Messages
#############################################

message_action_1 = MessageAction.find_or_create_by_subject({ :subject => 'RISE@Work Baseline Week', :body=>'<p> Welcome to the RISE@Work program! In this first week, you will be collecting baseline data about how many steps you usually take each day and over a week. Please do not change your usual routine. Your baseline steps will then be used to provide you with individualized goals to ramp up your steps over the next ten weeks.</p> <p>Check in once a day to log your steps. Find a time that works best for you so you can get in the habit of monitoring your daily steps.  For example, you could enter the previous day&#39;s steps first thing when you get to work. Or you could enter your daily steps before you shut down your computer at the end of the day. If you miss a day or two, make a note of your steps and you can still enter these within five days. </p>' }, :without_protection => true)
puts 'Message Action:' << message_action_1.subject
message_action_1.phase = phase
message_action_1.day_to_send = 0
 phase.message_actions << message_action_1

 message_action_2 = MessageAction.find_or_create_by_subject({ :subject => 'RISE@Work Phase 1 (Week 1)', :body=>'
  <p>You have successfully reached Phase 1 of the RISE@Work program! Your goal is to add 1000 steps/day to your baseline step count. Use your pedometer and the RISE@Work dashboard to monitor your progress toward this target.</p>
  <p>Click on the Achievements tool to see how many Badges you earned at baseline. Achievements are constantly updated so that you have an ongoing record of how much you have accomplished.</p>
  <p>During this week, try to sit less, break up extended bouts of sitting, and move more whenever you can in your daily working tasks. Sitting for long periods of time can be unhealthy. In fact, if you are sitting less often and moving frequently throughout the day, you can use more energy than someone who goes to the gym but spends their whole workday seated. </p>
  <p>Phase 1 encourages you to make small but important changes to your lifestyle. Please access the Support Strategies tool for tips on how to achieve your target in this phase. While some may not suit your routine, try to integrate these ideas into your working day wherever possible. Check out the <b>Take a Stand</b> app that you can use to remind you to take a break from sitting. You can download this app from the green bar at the bottom of your dashboard. Good luck!</p>' }, :without_protection => true)
puts 'Message Action:' << message_action_2.subject
message_action_2.phase = phase2
message_action_2.day_to_send = 0
phase.message_actions << message_action_2


 message_action_3 = MessageAction.find_or_create_by_subject({ :subject => 'RISE@Work Phase 1 (Week 2)', :body=>'
  <p>This is the last week of Phase 1. The target is to maintain 1000 steps/day over your baseline steps. Continue using your pedometer and the RISE@Work website to monitor your progress towards this target. The focus is on trying to make small but important changes to your daily routine in breaking up extended bouts of sitting.</p>
  <p>Access the Support Strategies for tips on how to achieve your new target. Try to integrate some of these ideas into your working day wherever possible, and earn an Achievement Badge in the process! If you haven&#39;t done so already, download and check out the <b>Take a Stand</b> app that will remind you to take a break from sitting. Good luck!</p>' }, :without_protection => true)
puts 'Message Action:' << message_action_3.subject
message_action_3.phase = phase2
message_action_3.day_to_send = 7
phase.message_actions << message_action_3


message_action_4 = MessageAction.find_or_create_by_subject({ :subject => 'RISE@Work Phase 2 (Week 3)', :body=>'
  <p>Welcome to Phase 2 of RISE@Work. Using a combination of strategies, your step target is to now add 2000 steps/day onto your baseline step count. Use your pedometer and the RISE@Work website to monitor your progress towards this target.</p>
  <p>During this second phase, incorporate shorter planned walks into your daily routine. This will bring additional health and work-related benefits to those you have already gained from reducing your time spent sitting. Shorter planned walks last for about 10 minutes and make you breathe a little harder and feel slightly warmer.</p>
  <p>You now have access to two new tools: Action Planning and Routes. Action Planning involves creating a detailed walking plan with the steps you will take so you can reach your new target step count. You could plan to walk some of the way to and from work, take a walk at lunch with a friend, or plan a walking meeting. The Routes tool provides ideas and links for short walks at your workplace. You could explore a new place to have coffee, run some errands or find a route that gives you the opportunity for "me time".</p>' }, :without_protection => true)
puts 'Message Action:' << message_action_4.subject
message_action_4.phase = phase3
message_action_4.day_to_send = 0

 message_action_5 = MessageAction.find_or_create_by_subject({ :subject => 'RISE@Work Phase 2 (Week 4)', :body=>'
  <p>This is the last week of Phase 2 of RISE@Work. Using a combination of strategies, your step target is to add 2000 steps/day onto your baseline step count. The pedometer and the RISE@Work website will help you to monitor your progress towards this target.</p>
  <p>During this second phase, add to your &#39;walking in daily tasks&#39; by incorporating shorter planned walks into your routine. If you haven&#39;t done so already, try the Action Planning and Routes tools to schedule short bouts of walking this week.</p>
  <p>Check out how many Achievement Badges you have collected and give yourself a pat on the back!</p>' }, :without_protection => true)
puts 'Message Action:' << message_action_5.subject
message_action_5.phase = phase3
message_action_5.day_to_send = 7


 message_action_6 = MessageAction.find_or_create_by_subject({ :subject => 'RISE@Work Phase 3 (Week 5)', :body=>'
  <p>Great job getting to Phase 3! Your target this phase is to increase your steps by 3000/day over your baseline. Use your pedometer, the RISE@Work website and Achievements tool to monitor your progress.</p>
  <p>In Phase 3, the focus will be for you to try and plan for longer walking activities (more than 10 minutes). When planning for these types of activities, you may find that you come across barriers that may steer you away from carrying through with your planned activity. It is often helpful to have a specific plan to overcome barriers that you may come across.</p>
  <p>Developing a plan ahead of time will help steer you towards the path of least (walking) resistance, and ultimately, success in leading a more active lifestyle.</p>
  <p>During this phase, use the Action Planning tool to brainstorm walking plans, potential barriers, and your strategies to overcome them. You also have access to ideas for longer walks at your workplace using the Routes tool. Explore these longer routes, form a walking group with your friends, or incorporate more walking into your journey to work. </p>' }, :without_protection => true)
puts 'Message Action:' << message_action_6.subject
message_action_6.phase = phase4
message_action_6.day_to_send = 0

 message_action_7 = MessageAction.find_or_create_by_subject({ :subject => 'RISE@Work Phase 3 (Week 6)', :body=>'
  <p>This is the last week of Phase 3 of RISE@Work. As a reminder, your step target is to add 3000 steps/day onto your baseline step count. Monitor your progress towards this target using the pedometer and RISE@Work website. Show off your achievement badges to your colleagues!</p>
  <p>Add to the steps you take while doing daily tasks by incorporating longer planned walks into your routine. If you haven&#39;t done so already, try the Action Planning tool to plan your walking activities and also your strategies to overcome any barriers.</p>' }, :without_protection => true)
puts 'Message Action:' << message_action_7.subject
message_action_7.phase = phase4
message_action_7.day_to_send = 7

 message_action_8 = MessageAction.find_or_create_by_subject({ :subject => 'RISE@Work Phase 4 (Week 7)', :body=>'
  <p>You&#39;ve made great progress by integrating different types of walking strategies into your working routine. The next challenge is to make these changes sustainable over the remaining four weeks of the program. Think about the ways you can integrate more walking into your lifestyle beyond the workplace.</p>
  <p>Using a combination of strategies and tools, your aim during Phase 4 is to maintain an increase of at least 3000 steps/day above your baseline step count. Use your pedometer and the RISE@Work website to monitor how well you are able to sustain this level of walking. Have a look at your Achievement Badges to remind yourself of how much you have already accomplished.</p>
  <p>Think about accumulating 3000 additional steps above baseline as a valuable minimum, and challenge yourself with how many steps you can do beyond this. Obtaining 10,000 steps/day is a recognised health target for adults. Are you close to or exceeding this daily step target? Good luck over the next two weeks!</p>' }, :without_protection => true)
puts 'Message Action:' << message_action_8.subject
message_action_8.phase = phase5
message_action_8.day_to_send = 0

 message_action_9 = MessageAction.find_or_create_by_subject({ :subject => 'RISE@Work Phase 4 (Week 8)', :body=>'
  <p>This is the last week of phase 4 of RISE@Work. Using a combination of strategies, your step target is to maintain 3000 steps/day over your baseline step count. Use your pedometer and the RISE@Work website to monitor how well you are able to sustain this level of walking.</p>
  <p>Think about accumulating 3000 additional steps above baseline as a valuable minimum, and challenge yourself with how many steps you can do beyond this. Accumulating 10,000 steps/day is a recognised health target for adults, but reaching 12,500 steps/day is even better and will put you in the "highly active" category. Are you close to these daily step targets?</p>
  <p>Review the all of the support strategies and tools that are available to you at RISE@Work. Continue to log your steps and collect Achievement Badges.</p>' }, :without_protection => true)
puts 'Message Action:' << message_action_9.subject
message_action_9.phase = phase5
message_action_9.day_to_send = 7

 message_action_10 = MessageAction.find_or_create_by_subject({ :subject => 'RISE@Work Phase 5 (Week 9)', :body=>'
  <p>You&#39;ve successfully reached the final phase of RISE@Work. You&#39;ve already made great progress by integrating different types of walking strategies into your working routine, and you have earned a full collection of Achievement Badges to prove it. Now, it is just a matter of keeping up the good work!</p>
  <p>Your aim for Phase 5 is to maintain an increase of at least 3000 steps/day above your baseline step count. Continue to use your pedometer, the website, <b>Take A Stand</b> alert app, and various tools to sustain this level of walking.</p>
  <p>Just like in Phase 4, think about accumulating 3000 additional steps above baseline as a valuable minimum, and see how many steps you can do beyond this. Good luck for the last two weeks of the program!</p>' }, :without_protection => true)
puts 'Message Action:' << message_action_10.subject
message_action_10.phase = phase6
message_action_10.day_to_send = 0

 message_action_11 = MessageAction.find_or_create_by_subject({ :subject => 'RISE@Work Phase 5 (Week 10)', :body=>'
  <p>This is the last week of Phase 5 and the final week of the RISE@Work program. As a reminder, your step target is to maintain 3000 steps/day over your baseline step count, but the more steps you can take, the greater the health benefits! Have you reached the 10,000 steps/day health target for adults? How about the "highly active" goal of 12,500 steps/day? If you haven&#39;t used the Support Strategies, Action Planning or Routes tools in a while, have another look and try something new.</p>
  <p>After you log your steps on the last day of this week, you will be prompted to complete the Follow-up Questionnaire that will take about 20 minutes to complete. You may answer the questions over multiple sessions if you are not able to finish it at one time. For example, you may start it at work and continue it at home, but please be sure to complete the entire questionnaire! Your feedback about RISE@Work will help us to improve the program for the future. Enjoy your week!</p>
  ' }, :without_protection => true)
puts 'Message Action:' << message_action_11.subject
message_action_11.phase = phase6
message_action_11.day_to_send = 7

message_action_12 = MessageAction.find_or_create_by_subject({ :subject => 'RISE@Work Wrap Up', :body=>'
  <p>Congratulations, you have reached the finish line of RISE@Work!</p>
  <p>We hope you have enjoyed your experience and gained many benefits from moving more and sitting less during your workday. Continue to sustain your enhanced step counts as an integrated part of your working day and lifestyle.</p>
  <p>At this time, your pedometer may be returned or you may choose to purchase it at the discounted price of $10. The pedometer or payment may be sent through campus mail to the following address: </p>
  <p><b>Dr. Michelle Stone</b><br>
School of Health and Human Performance<br>
Dalhousie University<br>
6230 South Street, Halifax, NS<br>
PO Box 15000<br>
B3H 4R2</p>
  <p>If you haven&#39;t already, please take about 20 minutes to give feedback on your experiences and thoughts relating to RISE@Work. Log onto the website to complete the Follow-up Questionnaire.</p>
  <p>Thank you for taking part in this program and we hope that you continue to enjoy being active and engaged throughout the days to come!</p>' }, :without_protection => true)
puts 'Message Action:' << message_action_12.subject
message_action_12.phase = phase6
message_action_12.day_to_send = 14


message_action_1.save
message_action_2.save
message_action_3.save
message_action_4.save
message_action_5.save
message_action_6.save
message_action_7.save
message_action_8.save
message_action_9.save
message_action_10.save
message_action_12.save
message_action_12.save



message_action_step_log_reminder = MessageAction.find_or_create_by_subject({ :subject => 'RISE@Work Step Loggin Reminder',:tags=>'step_logging_reminder', :body=>'<p>Great work so far, however you are have forgot to log your steps in the last few days.  Please log in and update your activity. (need copy)</p>' }, :without_protection => true)
puts 'Message Action:' << message_action_step_log_reminder.subject
message_action_step_log_reminder.save


#############################################
#Setup Achievements
#############################################

#Add complete baseline achievements


achievement13 = Achievement.find_or_create_by_name({:name => '25K Steps',:description => 'Walked 25000 steps total', :image =>'achv_ss_1.png' }, :without_protection => true)
achievement14 = Achievement.find_or_create_by_name({:name => '50K Steps',:description => 'Walked 50000 steps total', :image =>'achv_ss_2.png' }, :without_protection => true)
achievement15 = Achievement.find_or_create_by_name({:name => '100K Steps',:description => 'Walked 100000 steps total', :image =>'achv_ss_3.png' }, :without_protection => true)
achievement17 = Achievement.find_or_create_by_name({:name => '200K Steps',:description => 'Walked 200000 steps total', :image =>'achv_ss_4.png' }, :without_protection => true)
achievement18 = Achievement.find_or_create_by_name({:name => '500K Steps',:description => 'Walked 500000 steps total', :image =>'achv_ss_5.png' }, :without_protection => true)

achievement21 = Achievement.find_or_create_by_name({:name => 'Baseline',:description => 'Completed Baseline', :image =>'achv_ph_b.png' }, :without_protection => true)
achievement22 = Achievement.find_or_create_by_name({:name => 'Phase 1',:description => 'Completed Phase 1', :image =>'achv_ph_1.png' }, :without_protection => true)
achievement23 = Achievement.find_or_create_by_name({:name => 'Phase 2',:description => 'Completed Phase 2', :image =>'achv_ph_2.png' }, :without_protection => true)
achievement24 = Achievement.find_or_create_by_name({:name => 'Phase 3',:description => 'Completed Phase 3', :image =>'achv_ph_3.png' }, :without_protection => true)
achievement25 = Achievement.find_or_create_by_name({:name => 'Phase 4',:description => 'Completed Phase 4', :image =>'achv_ph_4.png' }, :without_protection => true)
achievement26 = Achievement.find_or_create_by_name({:name => 'Phase 5',:description => 'Completed Phase 5', :image =>'achv_ph_5.png' }, :without_protection => true)

achievement31 = Achievement.find_or_create_by_name({:name => 'Path Explorer',:description => 'Walked 1st route', :image =>'achv_r_1.png' }, :without_protection => true)
achievement32 = Achievement.find_or_create_by_name({:name => 'Path Pilot',:description => 'Walked 10 routes', :image =>'achv_r_2.png' }, :without_protection => true)
achievement33 = Achievement.find_or_create_by_name({:name => 'Path Master',:description => 'Walked 20 routes', :image =>'achv_r_3.png' }, :without_protection => true)
achievement34 = Achievement.find_or_create_by_name({:name => 'Path Pro',:description => 'Walked all routes', :image =>'achv_r_4.png' }, :without_protection => true)

achievement41 = Achievement.find_or_create_by_name({:name => 'Strategy Novice',:description => 'Implemented 1st support strategy', :image =>'achv_ss_1.png' }, :without_protection => true)
achievement42 =  Achievement.find_or_create_by_name({:name => 'Strategy Apprentice',:description => 'Implemented 10 support strategies', :image =>'achv_ss_2.png' }, :without_protection => true)
achievement43 =  Achievement.find_or_create_by_name({:name => 'Strategy Master',:description => 'Implemented 20 support strategies', :image =>'achv_ss_3.png' }, :without_protection => true)

achievement51 = Achievement.find_or_create_by_name({:name => 'Novice Planner',:description => 'Completed 1st Personalized Plan', :image =>'achv_ap_1.png' }, :without_protection => true)
achievement52 =  Achievement.find_or_create_by_name({:name => 'Apprentice Planner',:description => 'Completed 10 Personalized Plans', :image =>'achv_ap_2.png' }, :without_protection => true)
achievement53 =  Achievement.find_or_create_by_name({:name => 'Master Planner',:description => 'Completed 20 Personalized Plans', :image =>'achv_ap_3.png' }, :without_protection => true)

achievement61 =  Achievement.find_or_create_by_name({:name => 'Health Target',:description => 'Completed 10000 steps in a single day', :image =>'achv_ap_2.png' }, :without_protection => true)
achievement62 =  Achievement.find_or_create_by_name({:name => 'Highly Active',:description => 'Completed 12500 steps in a single day', :image =>'achv_ap_3.png' }, :without_protection => true)



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
<p>The questionnaire will take about 20 minutes to complete. All of the information that you provide will be kept in the strictest confidence.</p>
<p>Please read and answer every question to the best of your ability. For questions that ask you to report a time duration, please be as accurate as you can. For questions that ask you to select one answer from a range of options, choose the answer that best describes your situation or how you feel.</p>',:question_type => 'INFORMATION'}, :without_protection => true)

question0.save
baselinesurvey.survey_questions <<  question0;
section1.survey_questions <<  question0;
question0.survey_section = section1

question20 = SurveyQuestion.find_or_create_by_name({:name => 'Information20',:description=>'<p>This next set of questions focus on your current physical activity levels. We are interested in finding out about the kinds of physical activities that people do as part of their everyday lives.  The questions will ask you about the time you spent being physically active in the <b><u>last 7 days</u></b>.  Please answer each question even if you do not consider yourself to be an active person.  Please think about the activities you do at work, as part of your house and yard work, to get from place to place, and in your spare time for recreation, exercise or sport.</p>',:question_type => 'INFORMATION'}, :without_protection => true)


question20.save
baselinesurvey.survey_questions <<  question20;
section2.survey_questions <<  question20;
question20.survey_section = section2


question30 = SurveyQuestion.find_or_create_by_name({:name => 'Information31',:description=>'<p>For the following section, we are interested in learning more about your work environment. In particular, this next set of questions asks about the type of job you currently are employed at, the amount of time you usually spend at work, how you typically travel to and from work, as well as any physical activity you may participate in at work. </p>',:question_type => 'INFORMATION'}, :without_protection => true)


question30.save
baselinesurvey.survey_questions <<  question30;
section3.survey_questions <<  question30;
question30.survey_section = section3


question40 = SurveyQuestion.find_or_create_by_name({:name => 'Information40',:description=>'<p>For the following section, we are interested in learning more about your work environment. In particular, this next set of questions asks about the type of job you currently are employed at, the amount of time you usually spend at work, how you typically travel to and from work, as well as any physical activity you may participate in at work. </p>',:question_type => 'INFORMATION'}, :without_protection => true)


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


question50 = SurveyQuestion.find_or_create_by_name({:name => 'Information50',:description=>'<p>For the final section of this questionnaire, we are interested in learning about your overall satisfaction with different aspects of your life. In particular, this next set of questions refers to satisfaction with your physical, social, and emotional functioning.</p>',:question_type => 'INFORMATION'}, :without_protection => true)


question50.save
baselinesurvey.survey_questions <<  question50;
section5.survey_questions <<  question50;
question50.survey_section = section5


question60 = SurveyQuestion.find_or_create_by_name({:name => 'Information60',:description=>'<p>Thank you for completing the baseline questionnaire! You will now be redirected to the Rise@Work website where you can start logging your steps.</p>',:question_type => 'INFORMATION'}, :without_protection => true)


question60.save
baselinesurvey.survey_questions <<  question60;
section5.survey_questions <<  question60;
question60.survey_section = section5
question60.save

####### descriptions


@description = 'To begin, please answer the following questions relating to your demographic background.'
@description2 = '<b>Vigorous Physical Activity</b><p>Think about all the vigorous activities that you did in the last 7 days.  Vigorous physical activities refer to activities that take hard physical effort and make you breathe much harder than normal. Think only about those physical activities that you did for <u>at least 10 minutes at a time.</u></p>'
@description3 = '<b>Moderate Physical Activity</b><p>Think about all the <b>moderate</b> activities that you did in the <b>last 7 days.  Moderate</b> activities refer to activities that take <b><u>moderate physical effort</u></b> and make you <b><u>breathe somewhat harder than normal</u></b>. Again, think only about those physical activities that you did for <u>at least 10 minutes at a time.</u></p>'
@description4 = '<b>Walking</b><p>Think about the time you spent <b>walking</b> in the <b>last 7 days</b>.  This includes at work and at home, walking to travel from place to place, and any other walking that you have done solely for recreation, sport, exercise, or leisure.</p>'
@description5 = '<p>For the following questions we would like you to consider how much time you spent sitting (minutes) over the last 7 days. For example, 2 hours of sitting = 120 minutes, 4 hours = 240 minutes, and 8 hours = 480 minutes.</p>'
@description6 = '<p>Please estimate the <u>average</u> time (minutes) you spent SITTING <u>each</u> day in the following specific situations:</p><p>For example, 2 hours of sitting = 120 minutes, 4 hours = 240 minutes, and 8 hours = 480 minutes.</p>'
@description7 = '<p>The next two questions ask you to rate the amount of time you were <u>able</u> to handle certain parts of your job without difficulty.</p>'
@description8 = '<p>This question asks about difficulties you may have had at work.</p>'
@description9 = '<p>The next question asks about difficulties in relation to the people you came in contact with while working. These may include employers, supervisors, coworkers, clients, customers, or the public.</p>'
@description10 = '<p>These questions ask about how things went at work overall.</p>'
@description11 = '<p>The following 2 questions are about activities you might do during a typical day. Does your health now limit you in these activities?</p>'
@description12 = '<p>The last 4 questions are about how you feel and how things have been with you during the past 12 weeks. For each question, give the one answer that comes closest to the way you have been feeling.</p>'
@description13 = '<p>Does your health now limit you in this activity?</p>'


####### Section 1 Questions

question1 = SurveyQuestion.find_or_create_by_name({:name => 'Question1',:question=>'How old are you?',:description=>@description,:question_type => 'AGE'}, :without_protection => true)
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

question22 = SurveyQuestion.find_or_create_by_name({:name => 'Question22',:question=>'How much time did you usually spend doing vigorous physical activities on <u>one</u> of those days?',:description=>@description2,:question_type => 'MINUTESPERDAY'}, :without_protection => true)
question22.save
baselinesurvey.survey_questions <<  question22;
section2.survey_questions <<  question22;
question22.survey_section = section2
question21.next_question_id = question22.id;
question22.previous_question_id = question21.id;


question20.save
question21.save




question24 = SurveyQuestion.find_or_create_by_name({:name => 'Question24',:question=>'During the last 7 days, on how many days did you do moderate physical activities like carrying light loads, bicycling at a regular pace, or doubles tennis?  Do not include walking.',:description=>@description3,:question_type => 'DAYSPERWEEKM'}, :without_protection => true)
question24.save
baselinesurvey.survey_questions <<  question24;
section2.survey_questions <<  question24;
question24.survey_section = section2

question22.next_question_id = question24.id;
question24.previous_question_id = question22.id;

question22.save

question25 = SurveyQuestion.find_or_create_by_name({:name => 'Question25',:question=>'How much time did you usually spend doing moderate physical activities on <u>one</u> of those days?',:description=>@description3,:question_type => 'MINUTESPERDAY'}, :without_protection => true)
question25.save
baselinesurvey.survey_questions <<  question25;
section2.survey_questions <<  question25;
question25.survey_section = section2
question24.next_question_id = question25.id;
question25.previous_question_id = question24.id;


question24.save
question25.save


question21.skip_to_question_id = question24.id
question21.save

question27 = SurveyQuestion.find_or_create_by_name({:name => 'Question27',:question=>'During the <b>last 7 days</b>, on how many days did you <b>walk</b> for <u>at least 10 minutes at a time?</u>',:description=>@description4,:question_type => 'DAYSPERWEEKW'}, :without_protection => true)
question27.save
baselinesurvey.survey_questions <<  question27;
section2.survey_questions <<  question27;
question27.survey_section = section2

question25.next_question_id = question27.id;
question27.previous_question_id = question25.id;
question25.save
question28 = SurveyQuestion.find_or_create_by_name({:name => 'Question28',:question=>'How much time did you usually spend walking on <u>one</u> of those days?',:description=>@description4,:question_type => 'MINUTESPERDAY'}, :without_protection => true)
question28.save
baselinesurvey.survey_questions <<  question28;
section2.survey_questions <<  question28;
question28.survey_section = section2
question27.next_question_id = question28.id;
question28.previous_question_id = question27.id;


question28.next_question_id = question30.id;



question27.save
question28.save

question24.skip_to_question_id = question27.id
question24.save

### section 3



question31 = SurveyQuestion.find_or_create_by_name({:name => 'Question31',:question=>'During the last 7 days, how much time (minutes) did you spend sitting each day?<br>On a work day:',:description=>@description5,:question_type => 'MINUTESPERDAY'}, :without_protection => true)
question31.save
baselinesurvey.survey_questions <<  question31;
section3.survey_questions <<  question31;
question31.survey_section = section3

question27.skip_to_question_id = question31.id
question27.save

question31.previous_question_id = question30.id;

question30.next_question_id = question31.id;
question30.previous_question_id = question28.id;
question30.save

question32 = SurveyQuestion.find_or_create_by_name({:name => 'Question32',:question=>'During the last 7 days, how much time (minutes) did you spend sitting each day?<br>On a non-workday:',:description=>@description5,:question_type => 'MINUTESPERDAY'}, :without_protection => true)
question32.save
baselinesurvey.survey_questions <<  question32;
section3.survey_questions <<  question32;
question32.survey_section = section3
question31.next_question_id = question32.id;
question32.previous_question_id = question31.id;

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
question35 = SurveyQuestion.find_or_create_by_name({:name => 'Question35',:question=>'On a work day:<br>c)  While watching television',:description=>@description6,:question_type => 'MINUTESPERDAY'}, :without_protection => true)
question35.save
baselinesurvey.survey_questions <<  question35;
section3.survey_questions <<  question35;
question35.survey_section = section3
question34.next_question_id = question35.id;
question35.previous_question_id = question34.id;

question36 = SurveyQuestion.find_or_create_by_name({:name => 'Question36',:question=>'On a non-work day:<br>a)  While travelling to and from places',:description=>@description6,:question_type => 'MINUTESPERDAY'}, :without_protection => true)
question36.save
baselinesurvey.survey_questions <<  question36;
section3.survey_questions <<  question36;
question36.survey_section = section3
question35.next_question_id = question36.id;
question36.previous_question_id = question35.id;

question37 = SurveyQuestion.find_or_create_by_name({:name => 'Question37',:question=>'On a non-work day:<br>b)  While watching television',:description=>@description6,:question_type => 'MINUTESPERDAY'}, :without_protection => true)
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





question41 = SurveyQuestion.find_or_create_by_name({:name => 'Question41',:question=>'How would you describe your work? Choose <u>one</u> of the following answers',:description=>"",:question_type => 'JOBTYPE'}, :without_protection => true)
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

question43 = SurveyQuestion.find_or_create_by_name({:name => 'Question43',:question=>'On average, how many days do you work <u>per week</u>?',:description=>"",:question_type => 'DAYSPERWEEK'}, :without_protection => true)
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


question44 = SurveyQuestion.find_or_create_by_name({:name => 'Question44',:question=>'On average, how many hours do you typically work <u>per day</u>?',:description=>"",:question_type => 'HOURSPERDAY'}, :without_protection => true)
question44.save
baselinesurvey.survey_questions <<  question44;
section4.survey_questions <<  question44;
question44.survey_section = section4

question43.next_question_id = question44.id;
question44.previous_question_id = question43.id;
question43.save
question45 = SurveyQuestion.find_or_create_by_name({:name => 'Question45',:question=>'On average, how active do you think you are during your working day? Choose <u>one</u> of the following answers:',:description=>"",:question_type => 'ACTIVITYLEVEL'}, :without_protection => true)
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


question47 = SurveyQuestion.find_or_create_by_name({:name => 'Question47',:question=>'How many minutes do you spend each day being active during your journey <u>to and from</u> work?',:description=>"",:question_type => 'MINUTESPERDAY'}, :without_protection => true)
question47.save
baselinesurvey.survey_questions <<  question47;
section4.survey_questions <<  question47;
question47.survey_section = section4

question46.next_question_id = question47.id;
question47.previous_question_id = question46.id;
question46.save

question47.next_question_id = question401.id;
question401.previous_question_id = question47.id

question48 = SurveyQuestion.find_or_create_by_name({:name => 'Question48',:question=>'In the <u>past 2 weeks</u>, how much of the time did your physical health or emotional problems make it difficult for you to get going easily at the beginning of the workday?',:description=>"",:question_type => 'JOBDIFFICULT'}, :without_protection => true)
question48.save
baselinesurvey.survey_questions <<  question48;
section4.survey_questions <<  question48;
question48.survey_section = section4

question401.next_question_id = question48.id;
question48.previous_question_id = question401.id;



question49 = SurveyQuestion.find_or_create_by_name({:name => 'Question49',:question=>'In the <u>past 2 weeks</u>, how much of the time did your physical health or emotional problems make it difficult for you to start your job as soon as you arrived at work?',:description=>"",:question_type => 'JOBDIFFICULT'}, :without_protection => true)
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

question410 = SurveyQuestion.find_or_create_by_name({:name => 'Question410',:question=>'In the <u>past 2 weeks</u>, how much of the time were you able to sit, stand, or stay in one position for longer than 15 minutes while working, without difficulty caused by physical health or emotional problems?',:description=>@description7,:question_type => 'JOBCOMPLETION'}, :without_protection => true)
question410.save
baselinesurvey.survey_questions <<  question410;
section4.survey_questions <<  question410;
question410.survey_section = section4

question49.next_question_id = question410.id;
question410.previous_question_id = question49.id;
question49.save
question411 = SurveyQuestion.find_or_create_by_name({:name => 'Question411',:question=>'In the <u>past 2 weeks</u>, how much of the time were you able to repeat the same motions over and over again while working, without difficulty caused by physical health or emotional problems?',:question_type => 'JOBCOMPLETION'}, :without_protection => true)
question411.save
baselinesurvey.survey_questions <<  question411;
section4.survey_questions <<  question411;
question411.survey_section = section4

question410.next_question_id = question411.id;
question411.previous_question_id = question410.id;

question410.save

question412 = SurveyQuestion.find_or_create_by_name({:name => 'Question412',:question=>'In the <u>past 2 weeks</u>, how much of the time did your physical health or emotional problems make it difficult for you to concentrate on your work?',:description=>@description8,:question_type => 'JOBDIFFICULT'}, :without_protection => true)
question412.save
baselinesurvey.survey_questions <<  question412;
section4.survey_questions <<  question412;
question412.survey_section = section4
question411.next_question_id = question412.id;
question412.previous_question_id = question411.id;

question413 = SurveyQuestion.find_or_create_by_name({:name => 'Question413',:question=>'In the <u>past 2 weeks</u>, how much of the time did your physical health or emotional problems make it difficult for you to speak with people in-person, in meetings, or on the phone?',:description=>@description9,:question_type => 'JOBDIFFICULT'}, :without_protection => true)
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


question414 = SurveyQuestion.find_or_create_by_name({:name => 'Question414',:question=>'In the <u>past 2 weeks</u>, how much of the time did your physical health or emotional problems make it difficult for you to handle the workload?',:description=>@description10,:question_type => 'JOBDIFFICULT'}, :without_protection => true)
question414.save
baselinesurvey.survey_questions <<  question414;
section4.survey_questions <<  question414;
question414.survey_section = section4

question413.next_question_id = question414.id;
question414.previous_question_id = question413.id;

question413.save

question415 = SurveyQuestion.find_or_create_by_name({:name => 'Question415',:question=>'In the <u>past 2 weeks</u>, how much of the time did your physical health or emotional problems make it difficult for you to finish work on time?',:description=>@description10,:question_type => 'JOBDIFFICULT'}, :without_protection => true)
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



question52 = SurveyQuestion.find_or_create_by_name({:name => 'question52',:question=>'Moderate activities such as moving a table, pushing a vacuum cleaner, bowling or playing golf. If so, how much?',:description=>@description11,:question_type => 'ACTIVITYLIMIT'}, :without_protection => true)
question52.save
baselinesurvey.survey_questions <<  question52;
section5.survey_questions <<  question52;
question52.survey_section = section5
question51.next_question_id = question52.id;
question52.previous_question_id = question51.id;

question53 = SurveyQuestion.find_or_create_by_name({:name => 'question53',:question=>'Climbing several flights of stairs. If so, how much?',:description=>@description13,:question_type => 'ACTIVITYLIMIT'}, :without_protection => true)
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


question54 = SurveyQuestion.find_or_create_by_name({:name => 'question54',:question=>'During the past <u>12 weeks</u>, have you accomplished less than you would like as a result of your <u>physical health</u>?',:description=>"",:question_type => 'YESNO'}, :without_protection => true)
question54.save
baselinesurvey.survey_questions <<  question54;
section5.survey_questions <<  question54;
question54.survey_section = section5

question53.next_question_id = question54.id;
question54.previous_question_id = question53.id;

question53.save

question55 = SurveyQuestion.find_or_create_by_name({:name => 'question55',:question=>'During the past <u>12 weeks</u>, were you limited in the kind of work or other regular activities you do as a result of your <u>physical health</u>?',:description=>"",:question_type => 'YESNO'}, :without_protection => true)
question55.save
baselinesurvey.survey_questions <<  question55;
section5.survey_questions <<  question55;
question55.survey_section = section5
question54.next_question_id = question55.id;
question55.previous_question_id = question54.id;

question56 = SurveyQuestion.find_or_create_by_name({:name => 'question56',:question=>'During the past <u>12 weeks</u>, have you accomplished less than you would like to as a result of any <u>emotional problems</u>, such as feeling depressed or anxious?',:description=>"",:question_type => 'YESNO'}, :without_protection => true)
question56.save
baselinesurvey.survey_questions <<  question56;
section5.survey_questions <<  question56;
question56.survey_section = section5
question55.next_question_id = question56.id;
question56.previous_question_id = question55.id;

question54.save
question55.save



question57 = SurveyQuestion.find_or_create_by_name({:name => 'question57',:question=>'During the past <u>12 weeks</u>, did you not do work or other regular activities as carefully as usual as a result of any <u>emotional problems</u> such as feeling depressed or anxious?',:description=>"",:question_type => 'YESNO'}, :without_protection => true)
question57.save
baselinesurvey.survey_questions <<  question57;
section5.survey_questions <<  question57;
question57.survey_section = section5

question56.next_question_id = question57.id;
question57.previous_question_id = question56.id;


question56.save


question58 = SurveyQuestion.find_or_create_by_name({:name => 'question58',:question=>'How many <u>hours</u> (0-8) in a typical 8-hour work day does back pain interfere with accomplishing tasks at work?',:description=>"",:question_type => 'HOURSPERDAY'}, :without_protection => true)
question58.save
baselinesurvey.survey_questions <<  question58;
section5.survey_questions <<  question58;
question58.survey_section = section5

question57.next_question_id = question58.id;
question58.previous_question_id = question57.id;

question59 = SurveyQuestion.find_or_create_by_name({:name => 'question59',:question=>'How many <u>hours</u> (0-8) in a typical 8-hour work day does depression or anxiety interfere with accomplishing tasks at work?',:description=>"",:question_type => 'HOURSPERDAY'}, :without_protection => true)
question59.save
baselinesurvey.survey_questions <<  question59;
section5.survey_questions <<  question59;
question59.survey_section = section5
question58.next_question_id = question59.id;
question59.previous_question_id = question58.id;

question57.save
question58.save
question59.save

question510 = SurveyQuestion.find_or_create_by_name({:name => 'question510',:question=>'During the past <u>12 weeks</u>, how much did <u>physical pain</u> interfere with your normal work, including both work outside the home or housework?',:description=>"",:question_type => 'CONCENTRATION'}, :without_protection => true)
question510.save
baselinesurvey.survey_questions <<  question510;
section5.survey_questions <<  question510;
question510.survey_section = section5

question59.next_question_id = question510.id;
question510.previous_question_id = question59.id;
question59.save
question511 = SurveyQuestion.find_or_create_by_name({:name => 'question511',:question=>'During the past <u>12 weeks</u>, how much difficulty did you have concentrating at work and accomplishing tasks because of <u>physical or emotional</u> problems?',:description=>"",:question_type => 'CONCENTRATION'}, :without_protection => true)
question511.save
baselinesurvey.survey_questions <<  question511;
section5.survey_questions <<  question511;
question511.survey_section = section5

question510.next_question_id = question511.id;
question511.previous_question_id = question510.id;

question512 = SurveyQuestion.find_or_create_by_name({:name => 'question512',:question=>'How much time during the past <u>12 weeks</u> have you felt down?',:description=>@description12,:question_type => 'FEELING'}, :without_protection => true)
question512.save
baselinesurvey.survey_questions <<  question512;
section5.survey_questions <<  question512;
question512.survey_section = section5
question511.next_question_id = question512.id;
question512.previous_question_id = question511.id;

question513 = SurveyQuestion.find_or_create_by_name({:name => 'question513',:question=>'During the past <u>12 weeks</u>, how much of the time has your <u>physical health or emotional problems</u> interfered with your social activities like visiting with friends, relatives etc.?',:description=>"",:question_type => 'FEELING'}, :without_protection => true)
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


question514 = SurveyQuestion.find_or_create_by_name({:name => 'question514',:question=>'How much time during the past <u>12 weeks</u> have you felt calm and peaceful?',:description=>"",:question_type => 'FEELING'}, :without_protection => true)
question514.save
baselinesurvey.survey_questions <<  question514;
section5.survey_questions <<  question514;
question514.survey_section = section5

question513.next_question_id = question514.id;
question514.previous_question_id = question513.id;
question513.save
question515 = SurveyQuestion.find_or_create_by_name({:name => 'question515',:question=>'How much of the time during the past <u>12 weeks</u> did you have a lot of energy?',:description=>"",:question_type => 'FEELING'}, :without_protection => true)
question515.save
baselinesurvey.survey_questions <<  question515;
section5.survey_questions <<  question515;
question515.survey_section = section5
question514.next_question_id = question515.id;
question515.previous_question_id = question514.id;

question514.save
question515.save

question515.next_question_id = question60.id;
question60.previous_question_id = question515.id
question60.save
question515.save
puts 'Baseline Survey Seeded'

load "#{Rails.root}/db/seedsfollowup.rb"