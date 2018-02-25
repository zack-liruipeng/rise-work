class CreateMessageActionUsers < ActiveRecord::Migration
  def change
    create_table :message_action_users do |t|

      t.integer  :user_id
	  t.integer  :message_action_id

      t.belongs_to :user
      t.belongs_to :message_action

      t.timestamps
    end
  end
end
