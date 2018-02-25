class ActivitiesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @activities = current_user.activities
  end

  def new
    @activity = Activity.new
    @activity.user_id = current_user.id
  end

  def create




    if (params[:activity][:activity_date].to_date && params[:activity][:amount].to_i > 0)

      if (params[:activity][:activity_date].to_date) > (DateTime.now.to_date)
        return redirect_to :back , :alert => "Steps not logged. Too far into the future... You have not taken those steps yet."
      end


      to_date = params[:activity][:activity_date].to_date + 1.day
      @activies = current_user.activities.where("activity_date >= ? and activity_date < ?", params[:activity][:activity_date].to_date, to_date)

      if (@activies.count > 0)

        return redirect_to :back , :alert => "You have already logged steps for the day."
      else
        #if not base line

        lateStepLog = false;




        loggedDate = params[:activity][:activity_date].to_date;

        if ((DateTime.now-5.days).to_date > loggedDate)
          return redirect_to :back , :alert => "Steps not logged.  Date is too far in the past."

        elsif (current_user_phase.start_date.to_date > loggedDate)  && (current_user_phase.phase.name != "Baseline")
          lateStepLog = true;
        elsif  (current_user_phase.start_date.to_date > loggedDate) && (current_user_phase.phase.name == "Baseline")

          return redirect_to :back , :alert => "Steps not logged.  Date is too far in the past."

        end


        ## bug for loggin old steps

        @activity = Activity.new
        @activity.activity_type = params[:activity][:activity_type]
        @activity.activity_date = params[:activity][:activity_date]
        @activity.amount = params[:activity][:amount]
        @activity.note = params[:activity][:note]
        @activity.user_id = current_user.id


        if  (lateStepLog == false)
          current_user_phase.activities <<  @activity



          if  ((DateTime.now.beginning_of_day)..(DateTime.now)).include?(loggedDate.to_time_in_current_zone)
            @activity.ppv = 5;
          elsif  (((DateTime.now - 1.day).beginning_of_day)..(DateTime.now)).include?(loggedDate.to_time_in_current_zone)
            @activity.ppv = 4;
          elsif  (((DateTime.now - 2.day).beginning_of_day)..(DateTime.now)).include?(loggedDate.to_time_in_current_zone)
            @activity.ppv = 3;
          elsif  (((DateTime.now - 3.day).beginning_of_day)..(DateTime.now)).include?(loggedDate.to_time_in_current_zone)
            @activity.ppv = 2;
          elsif  (((DateTime.now - 5.day).beginning_of_day)..(DateTime.now)).include?(loggedDate.to_time_in_current_zone)
            @activity.ppv = 1;
          else
            @activity.ppv = 0;
          end


          if (current_user.ppv.nil? == false)

            current_user.ppv = 0;

          end


          current_user.ppv = current_user.ppv + @activity.ppv


          # ((2.weeks.ago)..(1.week.ago)).include?(record.created_at)

          #if  ((DateTime.now.beginning_of_day)..(DateTime.now)).include?(DateTime.now)


          #if loggedDate DateTime.now..1.week.ago

          #current_user.ppv = current_user.ppv +1;
          @activity.save
          redirect_to :back , :notice => "Steps logged."
        else

          prev_user_phase = UserPhase.find(current_user_phase.previous_user_phase)
          prev_user_phase.activities <<  @activity

          @activity.save
          prev_user_phase.save
          redirect_to :back , :notice => "Steps logged for previous phase.  Please try to keep up with your routine."
        end


      end

    else
      redirect_to :back , :alert => "Steps not logged.  Invalid date and/or step count."
    end

  end

  def update

    @activity = Activity.find(params[:id])
    @activity.user_id = current_user.id
    current_user_phase.activities <<  @activity
    @activity.update_attributes(params[:activity])
    redirect_to :back , :notice => "Activity updated."

  end


  def show
    authorize! :show, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    @activities = @user.activities.order('id ASC')


    respond_to do |format|
      format.html # show.html.erb
      format.xml

    end



  end
end
