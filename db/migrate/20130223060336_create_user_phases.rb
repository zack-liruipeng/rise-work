class CreateUserPhases < ActiveRecord::Migration
  def change
    create_table :user_phases do |t|
      t.integer  :user_id
      t.integer  :user_study_id
      t.integer  :phase_id
      t.integer  :status_id
      t.datetime :start_date
      t.datetime :end_date
      t.integer  :phase_baseline
      t.integer  :previous_user_phase
      t.integer  :next_user_phase
      t.timestamps
    end
  end
end
