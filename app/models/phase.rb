class Phase < ActiveRecord::Base
  attr_accessible :phase_id, :name,:description,:duration_in_days,:start_on_day_of_study,:finish_on_day_of_study,:phase_baseline_percent_increase,:order_id,:overall_phase_goal,:daily_phase_goal

  belongs_to :study

  has_and_belongs_to_many :strategies

  has_many :user_phases
  has_many :users , :through => :user_phases

  has_many :message_actions

end
   