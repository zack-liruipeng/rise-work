#############################################
#Setup Followup Survey
#############################################

baselinesurvey = Survey.find_or_create_by_name({:name => 'Phase 5',:title=>'RISE@Work Baseline Questionnaire',:description => 'Before you begin the RISE@Work program, we are interested in finding out about your general health and wellbeing.'}, :without_protection => true)
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

section6 = SurveySection.find_or_create_by_name({:name => 'Section6',:title=>'Section 6: Your Impressions of the RISE@Work Website and Tools',:description => 'Please answer the following demographic questiosn so that we may know you better.'}, :without_protection => true)
section6.save

baselinesurvey.survey_sections <<  section6;


###### Intro Questions ######
question0 = SurveyQuestion.find_or_create_by_name({:name => 'Information0',:description=>'
<p>Congratulations on completing the RISE@Work program! As a final request, we would like to ask some broad questions about you, your physical activity participation, sitting time, work productivity and general questions about your health and wellbeing. Many of these questions are the same as the ones that you were asked before starting the program. We would also like to hear about your impressions of the RISE@Work website and program, so be sure to complete all of the questions!</p>
<p>This questionnaire will take about 30 minutes to complete. As a reminder, all of the information that you provide will be kept in the strictest confidence.</p>
<p>As before, please read and answer every question to the best of your ability. For questions that ask you to report the time (duration) of an activity, please be as accurate as you can. For questions that ask you to select one answer from a range of options, choose the answer that best describes your situation or how you feel.</p>',:question_type => 'INFORMATION'}, :without_protection => true)

question0.save
baselinesurvey.survey_questions <<  question0;
section1.survey_questions <<  question0;
question0.survey_section = section1

question20 = SurveyQuestion.find_or_create_by_name({:name => 'Information20',:description=>'<p>This next set of questions focus on your current physical activity levels. We are interested in finding out about the kinds of physical activities that people do as part of their everyday lives.  The questions will ask you about the time you spent being physically active in the <b><u>last 7 days</u></b>.  Please answer each question even if you do not consider yourself to be an active person.  Please think about the activities you do at work, as part of your house and yard work, to get from place to place, and in your spare time for recreation, exercise or sport.</p>',:question_type => 'INFORMATION'}, :without_protection => true)


question20.save
baselinesurvey.survey_questions <<  question20;
section2.survey_questions <<  question20;
question20.survey_section = section2


question30 = SurveyQuestion.find_or_create_by_name({:name => 'Information31',:description=>'<p>For the following section, we are interested in learning more about your work environment. In particular, this next set of questions ask about the type of job you currently are employed at, the amount of time you usually spend at work, how you typically travel to and from work, as well as any physical activity you may participate in at work. </p>',:question_type => 'INFORMATION'}, :without_protection => true)


question30.save
baselinesurvey.survey_questions <<  question30;
section3.survey_questions <<  question30;
question30.survey_section = section3


question40 = SurveyQuestion.find_or_create_by_name({:name => 'Information40',:description=>'<p>For the following section, we are interested in learning more about your work environment. In particular, this next set of questions ask about the type of job you currently are employed at, the amount of time you usually spend at work, how you typically travel to and from work, as well as any physical activity you may participate in at work. </p>',:question_type => 'INFORMATION'}, :without_protection => true)


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


question50 = SurveyQuestion.find_or_create_by_name({:name => 'Information50',:description=>'<p>For the final section of this questionnaire, we are interested in learning about your overall satisfaction with different aspects of your life. In particular, this next set of questions refer to satisfaction with your physical, social, and emotional functioning.</p>',:question_type => 'INFORMATION'}, :without_protection => true)


question50.save
baselinesurvey.survey_questions <<  question50;
section5.survey_questions <<  question50;
question50.survey_section = section5


question60 = SurveyQuestion.find_or_create_by_name({:name => 'Information60',:description=>'<p>The final section of this questionnaire asks you about your feelings towards various aspects of the RISE@Work website. Where possible, adjustments will be made to the website to reflect this feedback and improve participant experiences. For each of the following questions, please let us know how much you agree or disagree with the statements.</p>',:question_type => 'INFORMATION'}, :without_protection => true)


question60.save
baselinesurvey.survey_questions <<  question60;
section5.survey_questions <<  question60;
question60.survey_section = section5
question60.save


question70 = SurveyQuestion.find_or_create_by_name({:name => 'Information70',:description=>'
	<p>Thank you for your feedback! We hope you enjoyed the program, and wish you continued success with setting and achieving your step count goals.</p>
	<p><b>The RISE@Work Team</b></p>',:question_type => 'INFORMATION'}, :without_protection => true)


question70.save
baselinesurvey.survey_questions <<  question70;
section5.survey_questions <<  question70;
question70.survey_section = section5
question70.save

####### descriptions


@description = 'To begin, please answer the question below relating to your demographic background.'
@description2 = '<b>Vigorous Physical Activity</b><p>Think about all the vigorous activities that you did in the last 7 days.  Vigorous physical activities refer to activities that take hard physical effort and make you breathe much harder than normal. Think only about those physical activities that you did for <u>at least 10 minutes at a time.</u></p>'
@description3 = '<b>Moderate Physical Activity</b><p>Think about all the <b>moderate</b> activities that you did in the <b>last 7 days.  Moderate</b> activities refer to activities that take <b><u>moderate physical effort</u></b> and make you <b><u>breathe somewhat harder than normal</u></b>. Again, think only about those physical activities that you did for <u>at least 10 minutes at a time.</u></p>'
@description4 = '<b>Walking</b><p>Think about the time you spent <b>walking</b> in the <b>last 7 days</b>.  This includes at work and at home, walking to travel from place to place, and any other walking that you have done solely for recreation, sport, exercise, or leisure.</p>'
@description5 = '<p>For the following questions we would like you to consider how much time you spent sitting over the last 7 days. For example, 2 hours of sitting = 120 minutes, 4 hours = 240 minutes, and 8 hours = 480 minutes.</p>'
@description6 = '<p>Please estimate the <u>average</u> time you spent SITTING <u>each</u> day in the following specific situations:</p>'
@description7 = '<p>The next two questions ask you to rate the amount of time you were <u>able</u> to handle certain parts of your job without difficulty.</p>'
@description8 = '<p>This question asks about difficulties you may have had at work.</p>'
@description9 = '<p>The next question asks about difficulties in relation to the people you came in contact with while working. These may include employers, supervisors, coworkers, clients, customers, or the public.</p>'
@description10 = '<p>These questions ask about how things went at work overall.</p>'
@description11 = '<p>The following 2 questions are about activities you might do during a typical day. Does your health now limit you in these activities?</p>'
@description12 = '<p>The last 4 questions are about how you feel and how things have been with you during the past 12 weeks. For each question, give the one answer that comes closest to the way you have been feeling.</p>'
@description13 = '<p>Does your health now limit you in this activity?</p>'


####### Section 1 Questions



question1 = SurveyQuestion.find_or_create_by_name({:name => 'Question1',:question=>'How much do you weigh (wearing light clothing and no shoes)?',:description=>@description,:question_type => 'WEIGHT'}, :without_protection => true)
question1.save
baselinesurvey.survey_questions <<  question1;
section1.survey_questions <<  question1;
question1.survey_section = section1
question1.previous_question_id = question0.id;


question0.save
question1.save





####### Section 2



question1.next_question_id = question20.id;
question20.previous_question_id = question1.id;
question1.save

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



question31 = SurveyQuestion.find_or_create_by_name({:name => 'Question31',:question=>'During the last 7 days, how much time did you spend sitting each day?<br>On a work day:',:description=>@description5,:question_type => 'MINUTESPERDAY'}, :without_protection => true)
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


question45 = SurveyQuestion.find_or_create_by_name({:name => 'Question45',:question=>'On average, how active do you think you are during your working day? Choose <u>one</u> of the following answers:',:description=>"",:question_type => 'ACTIVITYLEVEL'}, :without_protection => true)
question45.save
baselinesurvey.survey_questions <<  question45;
section4.survey_questions <<  question45;
question45.survey_section = section4
question45.previous_question_id = question40.id;
question40.next_question_id = question45.id;


question46 = SurveyQuestion.find_or_create_by_name({:name => 'Question46',:question=>'Does your journey to and from work involve any active transport (i.e., walking, running, cycling, or a combination of these activities for 10 minutes or more)?',:description=>"",:question_type => 'YESNOSKIP'}, :without_protection => true)
question46.save
baselinesurvey.survey_questions <<  question46;
section4.survey_questions <<  question46;
question46.survey_section = section4
question45.next_question_id = question46.id;
question46.previous_question_id = question45.id;

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


question414 = SurveyQuestion.find_or_create_by_name({:name => 'Question414',:question=>'In the past 2 weeks, how much of the time did your physical health or emotional problems make it difficult for you to handle the workload?',:description=>@description10,:question_type => 'JOBDIFFICULT'}, :without_protection => true)
question414.save
baselinesurvey.survey_questions <<  question414;
section4.survey_questions <<  question414;
question414.survey_section = section4

question413.next_question_id = question414.id;
question414.previous_question_id = question413.id;

question413.save

question415 = SurveyQuestion.find_or_create_by_name({:name => 'Question415',:question=>'In the past 2 weeks, how much of the time did your physical health or emotional problems make it difficult for you to finish work on time?',:description=>@description10,:question_type => 'JOBDIFFICULT'}, :without_protection => true)
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


#### section 6


question61 = SurveyQuestion.find_or_create_by_name({:name => 'question61',:question=>'Accessibility – the site loaded quickly',:description=>"",:question_type => 'AGREE'}, :without_protection => true)
question61.save
baselinesurvey.survey_questions <<  question61;
section6.survey_questions <<  question61;
question61.survey_section = section6

question61.previous_question_id = question60.id;
question61.save

question60.next_question_id = question61.id;
question60.save



question62 = SurveyQuestion.find_or_create_by_name({:name => 'question62',:question=>'Accessibility – the pictures and labels in each section of the dashboard were easy to understand',:description=>"",:question_type => 'AGREE'}, :without_protection => true)
question62.save
baselinesurvey.survey_questions <<  question62;
section6.survey_questions <<  question62;
question62.survey_section = section6

question62.previous_question_id = question61.id;
question62.save

question61.next_question_id = question62.id;
question61.save


question63 = SurveyQuestion.find_or_create_by_name({:name => 'question63',:question=>'Navigation - it was easy for me to find what I was looking for',:description=>"",:question_type => 'AGREE'}, :without_protection => true)
question63.save
baselinesurvey.survey_questions <<  question63;
section6.survey_questions <<  question63;
question63.survey_section = section6

question63.previous_question_id = question62.id;
question63.save

question62.next_question_id = question63.id;
question62.save


question64 = SurveyQuestion.find_or_create_by_name({:name => 'question64',:question=>'Navigation - the <u>Help</u> tutorial pages were useful to consult whenever I had any questions',:description=>"",:question_type => 'AGREE'}, :without_protection => true)
question64.save
baselinesurvey.survey_questions <<  question64;
section6.survey_questions <<  question64;
question64.survey_section = section6

question64.previous_question_id = question63.id;
question64.save

question63.next_question_id = question64.id;
question63.save

question65 = SurveyQuestion.find_or_create_by_name({:name => 'question65',:question=>'Design - the site was aesthetically appealing and I liked the colour choices',:description=>"",:question_type => 'AGREE'}, :without_protection => true)
question65.save
baselinesurvey.survey_questions <<  question65;
section6.survey_questions <<  question65;
question65.survey_section = section6

question65.previous_question_id = question64.id;
question65.save

question64.next_question_id = question65.id;
question64.save

question66 = SurveyQuestion.find_or_create_by_name({:name => 'question66',:question=>'Design - the layout worked well on my computer and/or mobile device',:description=>"",:question_type => 'AGREE'}, :without_protection => true)
question66.save
baselinesurvey.survey_questions <<  question66;
section6.survey_questions <<  question66;
question66.survey_section = section6

question66.previous_question_id = question65.id;
question66.save

question65.next_question_id = question66.id;
question65.save



question67 = SurveyQuestion.find_or_create_by_name({:name => 'question67',:question=>'Privacy and Security – I felt that the information that I entered on the website was secure',:description=>"",:question_type => 'AGREE'}, :without_protection => true)
question67.save
baselinesurvey.survey_questions <<  question67;
section6.survey_questions <<  question67;
question67.survey_section = section6

question67.previous_question_id = question66.id;
question67.save

question66.next_question_id = question67.id;
question66.save



question68 = SurveyQuestion.find_or_create_by_name({:name => 'question68',:question=>'Content - the text was informative and helpful',:description=>"",:question_type => 'AGREE'}, :without_protection => true)
question68.save
baselinesurvey.survey_questions <<  question68;
section6.survey_questions <<  question68;
question68.survey_section = section6

question68.previous_question_id = question67.id;
question68.save

question67.next_question_id = question68.id;
question67.save


question69 = SurveyQuestion.find_or_create_by_name({:name => 'question69',:question=>'Content - the graphs updated each time I logged new steps',:description=>"",:question_type => 'AGREE'}, :without_protection => true)
question69.save
baselinesurvey.survey_questions <<  question69;
section6.survey_questions <<  question69;
question69.survey_section = section6

question69.previous_question_id = question67.id;
question69.save

question68.next_question_id = question69.id;
question68.save


question610 = SurveyQuestion.find_or_create_by_name({:name => 'question610',:question=>'Motivational Tools - the Daily Steps, Steps over Phase and Overall Progress graphs were great motivational tools',:description=>"",:question_type => 'AGREE'}, :without_protection => true)
question610.save
baselinesurvey.survey_questions <<  question610;
section6.survey_questions <<  question610;
question610.survey_section = section6

question610.previous_question_id = question69.id;
question610.save

question69.next_question_id = question610.id;
question69.save

question611 = SurveyQuestion.find_or_create_by_name({:name => 'question611',:question=>'Motivational Tools – the Achievement Badges were great motivational tools',:description=>"",:question_type => 'AGREE'}, :without_protection => true)
question611.save
baselinesurvey.survey_questions <<  question611;
section6.survey_questions <<  question611;
question611.survey_section = section6

question611.previous_question_id = question610.id;
question611.save

question610.next_question_id = question611.id;
question610.save



question612 = SurveyQuestion.find_or_create_by_name({:name => 'question612',:question=>'Motivational Tools – the green Performance Bar on the dashboard that summarized my step stats and days left in each phase was a great motivational tool',:description=>"",:question_type => 'AGREE'}, :without_protection => true)
question612.save
baselinesurvey.survey_questions <<  question612;
section6.survey_questions <<  question612;
question612.survey_section = section6

question612.previous_question_id = question611.id;
question612.save

question611.next_question_id = question612.id;
question611.save

question613 = SurveyQuestion.find_or_create_by_name({:name => 'question613',:question=>'Take a Stand – the Take a Stand alert application was relevant and useful for me',:description=>"",:question_type => 'AGREENA'}, :without_protection => true)
question613.save
baselinesurvey.survey_questions <<  question613;
section6.survey_questions <<  question613;
question613.survey_section = section6

question613.previous_question_id = question612.id;
question613.save

question612.next_question_id = question613.id;
question612.save




question614 = SurveyQuestion.find_or_create_by_name({:name => 'question614',:question=>'Support Strategies – the variety of support strategies (e.g., park it, active emails, stand-walk-talk) was relevant and useful for me',:description=>"",:question_type => 'AGREENA'}, :without_protection => true)
question614.save
baselinesurvey.survey_questions <<  question614;
section6.survey_questions <<  question614;
question614.survey_section = section6

question614.previous_question_id = question613.id;
question614.save

question613.next_question_id = question614.id;
question613.save



question615 = SurveyQuestion.find_or_create_by_name({:name => 'question615',:question=>'Routes – the Routes tool with maps was relevant and useful for me',:description=>"",:question_type => 'AGREENA'}, :without_protection => true)
question615.save
baselinesurvey.survey_questions <<  question615;
section6.survey_questions <<  question615;
question615.survey_section = section6

question615.previous_question_id = question614.id;
question615.save

question614.next_question_id = question615.id;
question614.save


question616 = SurveyQuestion.find_or_create_by_name({:name => 'question616',:question=>'Action Planning – the Personalized Walking Plan unlocked in Phase 2 was relevant and useful for me',:description=>"",:question_type => 'AGREENA'}, :without_protection => true)
question616.save
baselinesurvey.survey_questions <<  question616;
section6.survey_questions <<  question616;
question616.survey_section = section6

question616.previous_question_id = question615.id;
question616.save

question615.next_question_id = question616.id;
question615.save


question617 = SurveyQuestion.find_or_create_by_name({:name => 'question617',:question=>'Action Planning – the Personalized Coping Plan unlocked in Phase 3 was relevant and useful for me',:description=>"",:question_type => 'AGREENA'}, :without_protection => true)
question617.save
baselinesurvey.survey_questions <<  question617;
section6.survey_questions <<  question617;
question617.survey_section = section6

question617.previous_question_id = question616.id;
question617.save

question616.next_question_id = question617.id;
question616.save

question618 = SurveyQuestion.find_or_create_by_name({:name => 'question618',:question=>'Are there any new Support Strategies that you would like to see added to the program?',:description=>"",:question_type => 'SPECIFY'}, :without_protection => true)
question618.save
baselinesurvey.survey_questions <<  question618;
section6.survey_questions <<  question618;
question618.survey_section = section6

question618.previous_question_id = question617.id;
question618.save

question617.next_question_id = question618.id;
question617.save

question619 = SurveyQuestion.find_or_create_by_name({:name => 'question619',:question=>'Do you have any final thoughts to share with us about the usability of the website, motivational tools, support strategies, etc.?',:description=>"",:question_type => 'AGREE'}, :without_protection => true)
question619.save
baselinesurvey.survey_questions <<  question619;
section6.survey_questions <<  question619;
question619.survey_section = section6

question619.previous_question_id = question618.id;
question619.save

question618.next_question_id = question619.id;
question618.save


question620 = SurveyQuestion.find_or_create_by_name({:name => 'question620',:question=>'Overall, I enjoyed using the RISE@Work website:',:description=>"",:question_type => 'SPECIFY'}, :without_protection => true)
question620.save
baselinesurvey.survey_questions <<  question620;
section6.survey_questions <<  question620;
question620.survey_section = section6

question620.previous_question_id = question619.id;
question620.save

question619.next_question_id = question620.id;
question619.save


question621 = SurveyQuestion.find_or_create_by_name({:name => 'question621',:question=>'Would you be interested in participating in future research with us?',:description=>"",:question_type => 'YESNO'}, :without_protection => true)
question621.save
baselinesurvey.survey_questions <<  question621;
section6.survey_questions <<  question621;
question621.survey_section = section6

question621.previous_question_id = question620.id;
question621.save

question620.next_question_id = question621.id;
question620.save


question70.previous_question_id = question621.id;
question70.save

question621.next_question_id = question70.id;
question621.save