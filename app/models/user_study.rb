class UserStudy < ActiveRecord::Base
  attr_accessible :user_id, :study_id, :start_date, :end_date,:current_user_phase,:user_phases,:baseline_survey_responceset_id,:followup_survey_responceset_id

  belongs_to :user
  belongs_to :study
  has_many :user_phases

end

 