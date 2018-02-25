class Task < ActiveRecord::Base
   attr_accessible :name,:user_id,:user_phase_id,:task_subtype, :strategy_id, :description, :created_at, :completed_at, :duration, :remainder, :completed,:where,:when,:what,:activity_amount,:barriers
   attr_accessible :task_type,:ppv
 
  belongs_to :user
  belongs_to :user_phase
  belongs_to :strategy
end
