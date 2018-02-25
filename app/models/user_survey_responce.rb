class UserSurveyResponce < ActiveRecord::Base
  attr_accessible :id,:user_id, :survey_id,:survey_section_id,:survey_question_id,:user_survey_responce_set_id,:question_responce,:completed



 
 belongs_to :user
 belongs_to :survey_question
 belongs_to :survey_section
 belongs_to :user_survey_responce_set

validates :question_responce, :presence => {:message => "Please provide a valide responce"}

serialize :question_responce
end
