class UserSurveyResponceSet < ActiveRecord::Base
attr_accessible :user_id, :survey_id, :status_id, :current_section_id, :current_question_id, :completed 

 belongs_to :user
 belongs_to :survey

 has_many :user_survey_responces


end
