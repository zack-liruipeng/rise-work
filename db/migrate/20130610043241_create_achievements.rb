class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|

      t.integer :achievement_id

      t.string  :name
      t.string  :description
      t.string  :type
      t.string  :image
      t.string  :subject
      t.text    :tags
      t.text    :body

      t.integer :ppv

      t.timestamps
    end
  end
end
