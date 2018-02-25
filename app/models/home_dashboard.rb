class HomeDashboard < ActiveRecord::Base
  attr_accessible :people_walking, :steps_taken_daily, :steps_increasing_weekly, :total_steps_taken, :total_days_of_activity, :performance_indicator, :organization_id, :home_dashboard_id
end