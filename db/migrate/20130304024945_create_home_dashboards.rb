class CreateHomeDashboards < ActiveRecord::Migration
  def change
    create_table :home_dashboards do |t|
    t.integer :people_walking
    t.integer :steps_taken_daily
    t.integer :steps_increasing_weekly
    t.integer :total_steps_taken
    t.integer :total_days_of_activity
    t.string  :performance_indicator
	t.string  :organization_id
	t.string  :home_dashboard_id
    t.timestamps
    end
  end
end
