class MessageActionUser < ActiveRecord::Base
  attr_accessible :user_id, :message_action_id, :updated_at


  belongs_to :user
  belongs_to :message_action

end
