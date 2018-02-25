class CreateMessageActions < ActiveRecord::Migration
  def change
    create_table :message_actions do |t|

      t.integer :phase_id

      t.integer :day_to_send
      
      t.string  :subject
      t.text    :tags
      t.text    :body


      t.timestamps
    end

  end
end
