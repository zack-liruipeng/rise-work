class CreateUserStudies < ActiveRecord::Migration
  def change
    create_table :user_studies do |t|
	  t.integer  :user_id
	  t.integer  :study_id
	  t.integer  :status_id
    t.datetime :start_date
    t.datetime :end_date
    
    t.integer  :current_user_phase
    t.integer :baseline_survey_responceset_id
    t.integer :followup_survey_responceset_id

      t.timestamps
    end
  end
end
