class Status < ActiveRecord::Base
  attr_accessible :name, :description

  has_many :user_phases
end
