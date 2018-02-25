class CreateSurveyQuestions < ActiveRecord::Migration
  def change
    create_table :survey_questions do |t|

    	 t.integer  :survey_id
    	 t.integer  :survey_section_id

    	 t.integer  :next_question_id
		 t.integer  :previous_question_id

		 t.integer :skip_to_question_id
 
		 t.string  :question_type
	   t.string  :name
     t.string  :title
     t.text  :description
     t.string  :question



    	 

      t.timestamps
    end
  end
end
