class UserPhase < ActiveRecord::Base
  attr_accessible :phase_id,:status_id,:user_study_id, :start_date, :end_date, :phase_baseline,:previous_user_phase,:next_user_phase

  belongs_to :user
  belongs_to :user_study
  belongs_to :phase
  has_many :activities
  has_many :tasks
  belongs_to :status

end
