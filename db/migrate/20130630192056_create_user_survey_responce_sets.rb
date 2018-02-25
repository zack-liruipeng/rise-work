class CreateUserSurveyResponceSets < ActiveRecord::Migration
  def change
    create_table :user_survey_responce_sets do |t|


    	  t.integer  :user_id
		  t.integer  :survey_id
		  t.integer  :status_id
		  t.integer  :current_section_id
		  t.integer  :current_question_id
 		  t.boolean :completed ,   :default => false

      t.timestamps
    end
  end
end
