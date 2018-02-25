class MessageAction < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :phase_id,:day_to_send,:subject,:tags,:body

	belongs_to :phase

	has_many :message_action_users

	has_many :users, :through => :message_action_users
end
