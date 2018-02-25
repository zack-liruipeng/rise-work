class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.integer :user_phase_id
      t.string :activity_type
      t.date :activity_date
      t.integer :amount
      t.string :unit
      t.text :note

      t.integer :ppv

      t.timestamps
    end
  end
end
