class UserAchievement < ActiveRecord::Base
   attr_accessible :user_id, :achievement_id, :is_new

  belongs_to :user
  belongs_to :achievement

end
