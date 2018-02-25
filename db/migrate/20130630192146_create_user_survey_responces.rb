class CreateUserSurveyResponces < ActiveRecord::Migration
  def change
    create_table :user_survey_responces do |t|


    	t.integer  :user_id
		  t.integer  :survey_id
		  t.integer  :survey_section_id
		  t.integer  :survey_question_id
       t.integer :user_survey_responce_set_id
      t.string    :question_responce
		  

 		  t.boolean :completed ,   :default => false

      t.timestamps
    end
  end
end
