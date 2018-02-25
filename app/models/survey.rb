class Survey < ActiveRecord::Base
  attr_accessible :survey_id, :title,  :name , :description

  has_many :survey_sections
  has_many :survey_questions

end
