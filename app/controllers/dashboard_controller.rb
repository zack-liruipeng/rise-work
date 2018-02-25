class DashboardController < ApplicationController
  include ActionView::Helpers::NumberHelper
  before_filter :authenticate_user!

  def index

    require "matrix"

    #add userworkflowcontroller
    #userworkflowcontroller will controller the forward for each phase
    #controller will have many phases

    point = Struct.new(:x,:y)

    @new_achievements = current_user.new_achievements # current_user.achievements.find(:all, :conditions => ["user_achievements.is_new = ?", true ])

    @current_user.user_achievements.each do |usr_achv|

      usr_achv.is_new = false;
      usr_achv.save
    end

    @organization = Organization.find(@current_user.organization_id)




    #Get last 5 days fo activities
    #Get last 5 Tasks

    # For the last 5 days from today
    # iterate days for days and check if days equal day point based on day in past (5 today, 4 yesterday, 3 2 days ago, etc)
    # iterate tasks 1 point for each chedules task in the last 5 days 1 form compoeted task

    #assigsn ppv points

    @ParticipationPointValue = 0

    #if  ((DateTime.now.beginning_of_day)..(DateTime.now)).include?(DateTime.now)
    #@ParticipationPointValue = 2
    #end

    @daily_target = 0;

    @user_phase = current_user.user_phases.find_by_id(current_user.user_studies.find_by_study_id(1).current_user_phase)

    @user_tasks = current_user.tasks

    @user_name = current_user.name

    @actual_phase = @user_phase.phase

    @strategies = @user_phase.phase.strategies.uniq


    @phase_did_finish = false
    @phase_did_start = false

    @study_did_finish = false;


    @target_10K = false;
    @target_12_5K = false;

    if ((@actual_phase.name != "Baseline") && (@actual_phase.daily_phase_goal != nil) && (@user_phase.phase_baseline != nil))
      @daily_target = @actual_phase.daily_phase_goal + @user_phase.phase_baseline
    end

    if current_user_study.baseline_survey_responceset_id != nil

      @responce_baseline_responce_set = UserSurveyResponceSet.find(current_user_study.baseline_survey_responceset_id)

    end


    if current_user_study.followup_survey_responceset_id != nil

      @responce_followup_responce_set = UserSurveyResponceSet.find(current_user_study.followup_survey_responceset_id)

    end

    #set user time zone to org

    #set study start Date

    #set phase start date
    #check if current date > phase_Start_date + duration_in_days (adjusted for timezone)

    @current_of_phase_date_time = DateTime.now  # add time zone support



    if ((@user_phase.status.name == "NOTSTARTED") && (@actual_phase.name == "Baseline")&& @responce_baseline_responce_set && (@responce_baseline_responce_set.completed))

      @user_phase.status = Status.find_by_name("STARTING")


      if (@user_phase.previous_user_phase.nil? == false)
        @user_phase.start_date = @user_phase.previous_user_phase.end_date #TODO:Test this
      else
        @user_phase.start_date = @current_of_phase_date_time
      end

      @user_phase.end_date = @user_phase.start_date + @actual_phase.duration_in_days.days
      @user_phase.save
    elsif ((@user_phase.status.name == "NOTSTARTED") && (@actual_phase.name != "Baseline"))
      @user_phase.status = Status.find_by_name("STARTING")
      @user_phase.start_date =current_user.user_phases.find_by_id(@user_phase.previous_user_phase).end_date
      @user_phase.end_date = @user_phase.start_date + @actual_phase.duration_in_days.days
      @user_phase.save

    end



    if ((@user_phase.status.name == "STARTING") && (@current_of_phase_date_time.to_date === @user_phase.start_date.to_date))

      @phase_did_start = true
    end



    #if ((@user_phase.status.name == "STARTING") && (@current_of_phase_date_time >= (@user_phase.start_date + 1.days)) && (@current_of_phase_date_time < @user_phase.end_date))
    if ((@user_phase.status.name == "STARTING") && (((@current_of_phase_date_time.to_date >= (@user_phase.start_date.to_date + 1.days)))||(@phase_did_start == true)) && (@current_of_phase_date_time.to_date < @user_phase.end_date.to_date))

      @user_phase.status = Status.find_by_name("INPROGRESS")
      @user_phase.save


    elsif ((@user_phase.status.name == "INPROGRESS") && (@current_of_phase_date_time.to_date >= @user_phase.end_date.to_date))

      @user_phase.status = Status.find_by_name("FINISHED")
      @phase_did_finish = true
      @user_phase.save

    elsif  ((@user_phase.end_date.nil? == false) && (@current_of_phase_date_time.to_date > @user_phase.end_date.to_date))

      @user_phase.status = Status.find_by_name("FINISHED")
      @phase_did_finish = true
      @user_phase.save

      # make inprogress forve finish when pahse finishes
    end

    #asdfasdf<< asdfasda234324;


    if  ((@actual_phase.name != "Baseline") && (@user_phase.phase_baseline == 0))
      steps_taken = 0
      @current_user.activities.each do |activity|

        if activity.amount
          steps_taken += activity.amount;
        end
      end
      if (@current_user.activities.count > 0)
        @current_user_study.user_phases.each do |user_phase|
          user_phase.phase_baseline = steps_taken/@current_user.activities.count
          user_phase.save
        end
      end
    end

    #Make user baseline calculation get done if timezone error because local pc used




    if (@user_phase.status.name == "FINISHED") && (@current_of_phase_date_time.to_date >= (@user_phase.end_date.to_date))

      if  (@actual_phase.name == "Baseline")

        steps_taken = 0
        @user_phase.activities.each do |activity|

          if activity.amount
            steps_taken += activity.amount;
          end
        end
        # add check to see of users are have added at least on baseline thing...
        if (@user_phase.activities.count > 0)
          @current_user_study.user_phases.each do |user_phase|
            user_phase.phase_baseline = steps_taken/@user_phase.activities.count

            user_phase.save
          end

        end



      end

      if (@user_phase.next_user_phase.nil? == false)
        current_user_study.current_user_phase = @user_phase.next_user_phase
        current_user_study.save
        redirect_to '/dashboard' , :notice => @actual_phase.name + " Complete.  Time to start a new phase!"
      else
        @study_did_finish = true;
      end
    end


    @phase_graph_baseline_collection = [];


    @goal_collection_acc = []
    goal_acc = 0

    if (@user_phase.phase_baseline.nil? == true)
      @user_phase.phase_baseline = 0;
    end

    @actual_phase.duration_in_days.times do |i|
      #  if  (@actual_phase.name != "Baseline")
      @phase_graph_baseline_collection[i] = point.new(i,@actual_phase.daily_phase_goal + @user_phase.phase_baseline)

      goal_acc += @actual_phase.daily_phase_goal + @user_phase.phase_baseline
      @goal_collection_acc.push(point.new(i,goal_acc))
      # end
    end


    @phase_steps_logs = @user_phase.activities.count * (@actual_phase.daily_phase_goal + @user_phase.phase_baseline);

    @phase_steps_taken = 0
    @current_phase_collection = [];
    @current_phase_collection_acc = [];
    @current_phase_overbaseline = [];
    @current_phase_overbaseline_acc = [];
    @daily_phase_ticks = [];

    @user_phase.activities.sort_by(&:activity_date).each_with_index do |activity, index|

      #@user_phase.activities.each_with_index do |activity, index|

      @daily_phase_ticks.push([index + 0.3,(activity.activity_date.strftime("%b %d"))])


      if activity.amount

        @phase_steps_taken += activity.amount;


        if (@actual_phase.name != "Baseline") && (@phase_steps_taken > @goal_collection_acc[index].y)

          @current_phase_collection_acc.push(point.new(index,@goal_collection_acc[index].y))
          @current_phase_overbaseline_acc.push(point.new(index,@phase_steps_taken))
        else
          @current_phase_collection_acc.push(point.new(index,@phase_steps_taken))
          @current_phase_overbaseline_acc.push(point.new(index,0))
        end


        if (activity.amount > (@actual_phase.daily_phase_goal + @user_phase.phase_baseline))

          @current_phase_collection.push(point.new(index,@actual_phase.daily_phase_goal + @user_phase.phase_baseline))
          @current_phase_overbaseline.push(point.new(index,activity.amount))

        else
          @current_phase_collection.push(point.new(index,activity.amount))
          @current_phase_overbaseline.push(point.new(index,0))
        end

      end
    end

    @all_study_activities_collections = [];

    phase_colours = ["rgba(255,0,0,0.5)","rgba(0,255,0,0.5)","rgba(0,0,255,0.5)","rgba(255,255,0,0.5)","rgba(255,255,255,0.5)","rgba(50,50,0,0.5)","rgba(50,0,50,0.5)"];

    prev_activity_count = 0;

    @current_user.activities.sort_by(&:activity_date).each_with_index do |activity, index|

      @all_study_activities_collections.push(point.new(index,activity.amount))

    end


    phaseGraphSection = Struct.new(:under_baseline_points,:over_baseline_points,:baseline_points)


    @all_study_phase_collections = [];
    @all_study_phase_collections_hashes = Hash.new;

    phase_count = 0;

    @phase_tick = [];

    acc_activity_count = 0;

    @current_user.user_phases.sort_by(&:phase_id).each_with_index do |phase, index|


      sorted_activities = phase.activities.sort_by(&:activity_date)

      if sorted_activities.empty? == false



        #@phase_tick.push([acc_activity_count,phase.phase.name])

        @phase_tick.push([(sorted_activities.first.activity_date.strftime("%b %d, %Y")).to_time.to_i * 1000,phase.phase.name])

      end

      acc_activity_count += phase.activities.count;


      phase_under_baseline_collections = [];
      phase_over_baseline_collections = [];
      phase_baseline_collections = [];
      ################



      sorted_activities.each_with_index do |activity, index|

        if index > 0

          #@phase_tick.push([(activity.activity_date.strftime("%b %d, %Y")).to_time.to_i * 1000,activity.activity_date.strftime("%b %d")])

        end

        #@user_phase.activities.each_with_index do |activity, index|


        if activity.amount

          #phase_over_baseline_collections.push(point.new(prev_activity_count+index,activity.amount))
          phase_over_baseline_collections.push(point.new((activity.activity_date.strftime("%b %d, %Y")).to_time.to_i * 1000,activity.amount))

          if (activity.amount > (@actual_phase.daily_phase_goal + phase.phase_baseline))
            if (phase.phase.name != "Baseline")
              phase_baseline_collections.push(point.new((activity.activity_date.strftime("%b %d, %Y")).to_time.to_i * 1000,phase.phase.daily_phase_goal + phase.phase_baseline))
            end
            phase_under_baseline_collections.push(point.new(prev_activity_count+index,phase.phase.daily_phase_goal + phase.phase_baseline))
            # phase_over_baseline_collections.push(point.new(prev_activity_count+index,activity.amount))

          else

            if (phase.phase.name != "Baseline")
              phase_baseline_collections.push(point.new((activity.activity_date.strftime("%b %d, %Y")).to_time.to_i * 1000,phase.phase.daily_phase_goal + phase.phase_baseline))

            end
            phase_under_baseline_collections.push(point.new(prev_activity_count+index,activity.amount))
            # phase_over_baseline_collections.push(point.new(prev_activity_count+index,0))
          end

        end
      end

      baseline_threshold = 0
      if ((phase.phase.name != "Baseline") && (phase.phase_baseline != nil ))
        baseline_threshold = (@actual_phase.daily_phase_goal + phase.phase_baseline);
      end

      ############



      @all_study_phase_collections.push(phaseGraphSection.new(phase_under_baseline_collections,phase_over_baseline_collections,phase_baseline_collections));




      phase_count = phase_count+1;

      if phase_over_baseline_collections.empty? == false

        phase_over_baseline_collections.push(point.new((phase_over_baseline_collections.last.x+(1.day.to_i * 1000)),phase_over_baseline_collections.last.y))


        @all_study_phase_collections_hashes[phase.phase.name  + "Overbaseline"] = { :collection => phase_over_baseline_collections, :x => :x, :y => :y, :options => {:color => "rgba(161,209,77,1.0)",:shadowSize => "0",:lines =>{:show=>true},:points => {:show =>true},:threshold=>{:below=>baseline_threshold,:color=>"rgba(239,71,35,1.0)"} }}
      end

      if phase_under_baseline_collections.empty? == false

      end

      if phase_baseline_collections.empty? == false

        #@all_study_phase_collections_hashes[phase.phase.name  + "Baseline"] = { :collection => phase_baseline_collections, :x => :x, :y => :y, :options => {:color => "rgba(239,71,35,1.0)",:shadowSize => "0",:bars => {:show =>false},:lines => {:show =>true,:fill=>true},:points => {:show =>true},:fill=>true,:fillColor=> "{ colors: [ { opacity: 1 }, { opacity: 1 } ] }" }}

        phase_baseline_collections.push(point.new((phase_baseline_collections.last.x+(1.day.to_i * 1000)),phase_baseline_collections.last.y))

        @all_study_phase_collections_hashes[phase.phase.name  + "Baseline"] = { :collection => phase_baseline_collections, :x => :x, :y => :y, :options => {:color => "rgba(74,140,247,1.0)",:shadowSize => "0",:bars => {:show =>false},:points => {:show =>false},:lines => {:show =>true,:fill=>false},:points => {:show =>false},:fill=>false,:fillColor=> "{ colors: [ { opacity: 1 }, { opacity: 1 } ] }" }}



      end

      prev_activity_count += phase.activities.count;

    end

    #for all phases
    # each phase
    # get baseline points, get all activity points,

    #@phase_steps_taken = @user_phase.activities.all.each{|activity| activity.amount}.compact

    @phase_steps_total = (@actual_phase.duration_in_days * (@actual_phase.daily_phase_goal + @user_phase.phase_baseline))

    ppv_total = 0;

    ppv_for_star_ppvs = [];
    ppv_for_star_total = 0;

    @phase_steps_left = @phase_steps_total - @phase_steps_taken
    @total_steps_taken = 0
    current_user.activities.all.sort_by(&:activity_date).each_with_index do |activity, index|
      if activity.amount
        @total_steps_taken += activity.amount;

        if activity.ppv.nil? == true
          activity.ppv = 0;
        end

        ppv_total += activity.ppv;

        if  (activity.amount >=10000)
          @target_10K = true;
        end

        if  (activity.amount >=12300)
          @target_12_5K = true;
        end

        if (current_user.activities.count - index) <= 10
          ppv_for_star_ppvs.push(activity.ppv)
          ppv_for_star_total += activity.ppv
        end
      end
    end


    current_user.ppv = ppv_total;

    @star_performance = 0.6;

    if ppv_for_star_ppvs.count >0

      #@star_performance = ppv_for_star_total/ppv_for_star_ppvs.count

    end

    if @user_phase.end_date
      @days_left_in_phase = (@user_phase.end_date.to_date - @current_of_phase_date_time.to_date).to_i## DOTO: user dates could be wrong...fix here
      #@performance_vs_baseline = (@phase_steps_taken.to_f / @phase_steps_logs.to_f).round(2) * 100
      @maxPastDate =  @actual_phase.duration_in_days - @days_left_in_phase

      if (@maxPastDate  > 5 )
        @maxPastDate = 5
      end

    end
    @performance_vs_baseline = number_with_precision((@phase_steps_taken.to_f / @phase_steps_logs.to_f).round(2) * 100, :precision => 0)

    if @performance_vs_baseline == 'NaN'
      @performance_vs_baseline = '0';
    end





    @total_steps_taken_human_string = number_to_human(@total_steps_taken, :precision => 2, :units => {:unit => "", :thousand => "K", :million => "M"})

    if @phase_steps_left > 0

      @phase_steps_left_human_string = number_to_human(@phase_steps_left, :units => {:unit => "", :thousand => "K", :million => "M"})

    else

      @phase_steps_left_human_string = '0'

    end

    @phase_steps_taken_human_string = number_to_human(@phase_steps_taken, :units => {:unit => "", :thousand => "K", :million => "M"})


    #@zombie = 1/0
    #rescue ZeroDivisionError
    #0
    #valid_until.future? && valid_until < 7.days.since(Time.now).to_date
    if (@performance_vs_baseline.to_f > 100.0) || (@actual_phase.name == "Baseline")
      @performance_indicator = 'great'
    elsif (@performance_vs_baseline.to_f > 80.0)
      @performance_indicator = 'good'
    elsif (@performance_vs_baseline.to_f > 60.0)
      @performance_indicator = 'ok'
    elsif (@performance_vs_baseline.to_f == 0)
      @performance_indicator = 'ok'
    else
      @performance_indicator = 'poor'
    end


    @percent_complete = (@phase_steps_taken.to_f / @phase_steps_total.to_f) * 100


    #############################################
    #check achievements
    #############################################

    @user_achievements = current_user.achievements


    if (@total_steps_taken > 25000) && !@user_achievements.find_by_name('25K Steps')
      current_user.achievements << Achievement.find_by_name('25K Steps')
      #:notice => "Congratulations! You have earned a new achivement."
    end

    if (@total_steps_taken > 50000) && !@user_achievements.find_by_name('50K Steps')
      current_user.achievements << Achievement.find_by_name('50K Steps')
      #:notice => "Congratulations! You have earned a new achivement."
    end

    if (@total_steps_taken > 100000) && !@user_achievements.find_by_name('100K Steps')
      current_user.achievements << Achievement.find_by_name('100K Steps')
      #:notice => "Congratulations! You have earned a new achivement."
    end

    if (@total_steps_taken > 200000) && !@user_achievements.find_by_name('200K Steps')
      current_user.achievements << Achievement.find_by_name('200K Steps')
      #:notice => "Congratulations! You have earned a new achivement."
    end

    if (@total_steps_taken > 500000) && !@user_achievements.find_by_name('500K Steps')
      current_user.achievements << Achievement.find_by_name('500K Steps')
      #:notice => "Congratulations! You have earned a new achivement."
    end

    if (@actual_phase.name == "Phase 1") && !@user_achievements.find_by_name('Baseline')
      current_user.achievements << Achievement.find_by_name('Baseline')
      #:notice => "Congratulations! You have earned a new achivement."
    end

    if (@actual_phase.name == "Phase 2") && !@user_achievements.find_by_name('Phase 1')
      current_user.achievements << Achievement.find_by_name('Phase 1')
      #:notice => "Congratulations! You have earned a new achivement."
    end

    if (@actual_phase.name == "Phase 3") && !@user_achievements.find_by_name('Phase 2')
      current_user.achievements << Achievement.find_by_name('Phase 2')
      #:notice => "Congratulations! You have earned a new achivement."
    end

    if (@actual_phase.name == "Phase 4") && !@user_achievements.find_by_name('Phase 3')
      current_user.achievements << Achievement.find_by_name('Phase 3')
      #:notice => "Congratulations! You have earned a new achivement."
    end

    if (@actual_phase.name == "Phase 5") && !@user_achievements.find_by_name('Phase 4')
      current_user.achievements << Achievement.find_by_name('Phase 4')
      #:notice => "Congratulations! You have earned a new achivement."
    end



    @complete_SS = 0;
    @complete_R = 0;
    @complete_AP = 0;

    @user_tasks.each do |task|
      if task.completed == true

        if task.task_type == 'support'
          @complete_SS += 1
        elsif task.task_type == 'route'
          @complete_R += 1
        elsif task.task_type = 'userdefined'
          @complete_AP +=1


        end
      end
    end


    if (@complete_R > 0) && !current_user.achievements.find_by_name('Path Explorer')
      current_user.achievements << Achievement.find_by_name('Path Explorer')
    end
    if (@complete_R >= 10) && !current_user.achievements.find_by_name('Path Pilot')
      current_user.achievements << Achievement.find_by_name('Path Pilot')
    end
    if (@complete_R >= 20) && !current_user.achievements.find_by_name('Path Master')
      current_user.achievements << Achievement.find_by_name('Path Master')
    end

    if (@complete_SS > 0) && !current_user.achievements.find_by_name('Strategy Novice')
      current_user.achievements << Achievement.find_by_name('Strategy Novice')
    end
    if (@complete_SS >= 10) && !current_user.achievements.find_by_name('Strategy Apprentice')
      current_user.achievements << Achievement.find_by_name('Strategy Apprentice')
    end
    if (@complete_SS >= 20) && !current_user.achievements.find_by_name('Strategy Master')
      current_user.achievements << Achievement.find_by_name('Strategy Master')
    end


    if (@complete_AP > 0) && !current_user.achievements.find_by_name('Novice Planner')
      current_user.achievements << Achievement.find_by_name('Novice Planner')
    end
    if (@complete_AP >= 2) && !current_user.achievements.find_by_name('Apprentice Planner')
      current_user.achievements << Achievement.find_by_name('Apprentice Planner')
    end
    if (@complete_AP >= 4) && !current_user.achievements.find_by_name('Master Planner')
      current_user.achievements << Achievement.find_by_name('Master Planner')
    end

    if @target_10K && !current_user.achievements.find_by_name('Health Target')
      current_user.achievements << Achievement.find_by_name('Health Target')
    end

    if @target_12_5K && !current_user.achievements.find_by_name('Highly Active')
      current_user.achievements << Achievement.find_by_name('Highly Active')
    end





  end
end
