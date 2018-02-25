class MessageActionsController < ApplicationController

  def index

    @users = User.all

    #/new?key="77e5506b-15bd-41b9-8a5f-dc58cb00ead3"


    #if params[:key] == "77e5506b-15bd-41b9-8a5f-dc58cb00ead3"

    redirect_to '/' , :notice => "Resource not available."
    return

    fghfdhfdhfhfdg.fg

    @users.each do |user|

      last_step_logged = user.activities.order('activity_date ASC').last

      if  ( (user.email_alerts == true) && (last_step_logged.nil? == false) && (DateTime.now.ago(3.days).beginning_of_day.to_date > last_step_logged.activity_date.to_date))

        step_log_remainder_message_action = MessageAction.find_by_tags('step_logging_reminder')


        if (step_log_remainder_message_action.nil? == false)

          user_maction = user.message_action_users.find_by_user_id_and_message_action_id(user.id,step_log_remainder_message_action.id)

          if ((user_maction.nil? == false) && (DateTime.now.ago(7.days).beginning_of_day.to_date > user_maction.updated_at.to_date))
            user_maction.message_actions_user.touch

            PhaseMailer.phase_email(user,@user_phase,last_remainder_message_sent).deliver

          elsif (user_maction.nil? == true)
            user.message_actions << step_log_remainder_message_action

            PhaseMailer.phase_email(user,@user_phase,step_log_remainder_message_action).deliver


          end



        end
      end

      # should be sent every day? once every x Days?
      #find newest logged activity
      #inf > day missed send message
      #add to message queue

      @user_phase = user.user_phases.find_by_id(user.user_studies.find_by_study_id(1).current_user_phase)
      if (@user_phase.start_date.nil? == false)
        @user_tasks = user.tasks

        @user_name = user.name

        @actual_phase = @user_phase.phase

        @current_date_time = DateTime.now

        @day_of_phase = (@current_date_time.to_date - @user_phase.start_date.to_date).to_i

        @actual_phase.message_actions.each do |m_action|
          puts 'user:' << user.name
          puts 'day to send:' << m_action.day_to_send
          puts 'day of phase:' <<@day_of_phase


          if ((m_action.day_to_send <= @day_of_phase) && (user.message_actions.include?(m_action) == false))

            user.message_actions << m_action
            PhaseMailer.phase_email(user,@user_phase,m_action).deliver
          end
        end
      end
    end
  end
end
