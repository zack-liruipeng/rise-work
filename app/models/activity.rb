class Activity < ActiveRecord::Base
  attr_accessible :user_id, :user_phase_id,:activity_type, :activity_date, :amount, :unit, :note, :ppv

belongs_to :user_phases
belongs_to :users

end
