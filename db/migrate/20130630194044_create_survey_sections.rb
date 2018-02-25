class CreateSurveySections < ActiveRecord::Migration
  def change
    create_table :survey_sections do |t|

   		  t.integer  :survey_id
		  t.integer  :survey_section_id

		   t.string  :title
    		t.string  :name
   			t.string  :description

		   t.integer  :next_section_id
		   t.integer  :previous_section_id

      t.timestamps
    end
  end
end
