class SurveyQuestion < ActiveRecord::Base
 attr_accessible :survey_id, :survey_section_id, :next_question_id,:previous_question_id,:skip_to_question_id, :question_type
 attr_accessible :name,	:title,	:description,:question	
 

 has_many :user_survey_responces
 belongs_to :survey_section
 belongs_to :survey


end
