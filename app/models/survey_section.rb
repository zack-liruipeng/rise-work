class SurveySection < ActiveRecord::Base
   attr_accessible :survey_id, :survey_section_id,:title,:name,:description,:next_section_id,:previous_section_id

 belongs_to :survey
 
 has_many :survey_questions

end
