# encoding: UTF-8
# Question#is_mandatory is now false by default. The default_mandatory option allows you to set
#   is_mandatory for all questions in a survey.
survey "Health and Wellbeing Questionnaire", :default_mandatory => true do


section "Participant Information" do

label "</br><Thank you for expressing an interest in participating in Rise@Work, an 
exciting health initiative in your workplace. Before you decide to take this great
opportunity, it’s important that we explain the procedure clearly to you.
</br></br>
We are interested in exploring initiatives to get people moving more and sitting less in
the workplace. We would like to invite you to participate in a 10 week walking program
conducted at your worksite. The research findings will be particularly valuable in the
development of future health promotion strategies in office workplaces.
</br></br>
<b>What will you be required to do?</b></br>
The Rise@Work program encourages you to gradually increase your walking
in the workplace over a period of 10 weeks. We will provide you with a pedometer
‐ a simple, discrete tool that measures the steps you take each day ‐ and access to
the Rise@Work website which contains a range of practical support tools to help you
achieve your goals. Throughout the program we would like you to record the
number of steps you take during a working day. All information collected will
be confidential and completely anonymous. The program’s strategies to promote
walking are designed to complement rather than disrupt your workday, and reporting
your step count is quick and simple. In addition, we will ask you to complete a brief
questionnaire that will include questions about your age, sex, occupation, educational
qualifications, general health and lifestyle behaviours. During and following the study, we
will ask for feedback on your experiences and perceptions regarding the Rise@Work
program. Again, this information will be kept entirely confidential.</br></br>

Rise@Work is developed and conducted by experienced researchers who are
available throughout the program to assist with any concerns or queries.</br></br>

I have read and understand this participant information provided to me
concerning this initiative and I agree to participate in the Rise@Work study.</br></br>

<b>I understand that:</b></br>
• Taking part in the study involves participation in a 10 week workplace walking
program using a website and collection of data on step counts.</br>
• Throughout the program I will be asked to wear a pedometer and record my
step count during my working day.</br>
• During and following the study, I may be asked by researchers to report on my
experiences and perceptions regarding the Rise@Work program.</br>
• Participation in this study is voluntary. I can withdraw from the initiative at any
time without penalty by informing the Rise@Work research team and do not have
to give reasons for withdrawing.</br>
• All information will be confidential and only anonymous summary data will be
reported. The data collected may be published in such a way that my name is not
used, and that I can not be identified in any way.</br></br>

I agree to take part in this study I decline to take part in this study"
end

section "Instructions" do

label "<b>What is this questionnaire about?</b>"

label "Before you begin the Walk@Work program, we are interested in finding out about your general health and wellbeing. </br></br>The questionnaire should only take about 10 minutes to complete. All details you provide will be treated in the strictest confidence and will be used to inform your program."
end
  section "Your Physical Activity" do
    # A label is a question that accepts no answers
    label "The following questions relate to your physical activities over the last week (seven days). </br></br>
Please type your answers in the spaces provided, type '0' if you did not engage in the activity."

label "<b>Hard physical activity:</b>"
label "Think about all the vigorous activities which take hard physical effort that you did in the last 7 days. Vigorous activities make you breathe harder than normal and may include running, heavy lifting, aerobics or fast bicycling. Think only about those activities that you did for at least 10 minutes at a time."

 q "During the last 7 days, on how many days did you do vigorous physical activities?"
 a "|week/day", :integer

q "How much total time did you usually spend doing vigorous physical activities on one of those days?"
    a "|hours/days +", :integer
    a "|minutes/days ", :integer

    q "If your pattern of activity varies from day to day, how much total time did you spend over the last 7 days doing vigorous physical activity?"
    a "|hours/days +", :integer
    a "|minutes/days ", :integer

label "<b>Moderate physical activity:</b>"
label "Think about the activities which take moderate physical effort that you did in the last 7 days. Moderate physical activities make you breathe somewhat harder than normal and may include carrying light loads, bicycling at a regular pace or doubles tennis. Do not include walking. Again, think about only those activities that you did for at least 10 minutes."

 q "During the last 7 days, on how many days did you do moderate physical activities?"
 a "|week/day", :integer

q "How much total time did you usually spend doing moderate physical activities on one of those days?"
    a "|hours/days +", :integer
    a "|minutes/days ", :integer

    q "If your pattern of activity varies from day to day, how much total time did you spend over the last 7 days doing moderate physical activity?"
    a "|hours/days +", :integer
    a "|minutes/days ", :integer


  end

  section "Your Sitting" do

label "The following questions relate to how much time you spent sitting over the last week (seven days).</br></br> 
Please type your answers in the spaces provided."

label "Please estimate the average time you spent SITTING EACH DAY:"

 q "On a work day"
    a "|hours +", :integer
    a "|minutes ", :integer

q "On a non-work day"
    a "|hours +", :integer
    a "|minutes ", :integer



  end
end
