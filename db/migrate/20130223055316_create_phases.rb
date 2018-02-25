class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
	    t.integer :phase_id
      t.integer :study_id
      t.integer :order_id
      t.string  :name
      t.text    :description
      t.float   :phase_baseline_percent_increase
      t.integer :duration_in_days
      t.integer :start_on_day_of_study
      t.integer :finish_on_day_of_study
      t.integer :daily_phase_goal
      t.integer :overall_phase_goal
      t.timestamps
    end
  end
end
