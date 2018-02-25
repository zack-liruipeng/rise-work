class Achievement < ActiveRecord::Base
  attr_accessible :achievement_id,:title, :body,:name,:description,:type,:image,:subject,:tags

  has_many :user_achievements
  has_many :users , :through => :user_achievements


end
