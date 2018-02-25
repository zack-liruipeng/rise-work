class CreateUserAchievements < ActiveRecord::Migration
  def change
    create_table :user_achievements do |t|

      t.integer  :user_id
	  t.integer  :achievement_id

	  t.boolean :is_new,   :default => true

      t.timestamps
    end
  end
end
