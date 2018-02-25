xml.instruct!
xml.step_log do
      xml.user_email @user.email
      xml.phases do
       @user.user_phases.order('id ASC').each do |user_phase|
        xml.phase do
        xml.phase_name user_phase.phase.name
        xml.steps do
            user_phase.activities.order('activity_date ASC').each do |activity|
          xml.step do
            xml.date_logged_on activity.created_at
            xml.date_logged_for activity.activity_date
            xml.amount activity.amount
          end
          end
        end
        end
        end
      end

end

