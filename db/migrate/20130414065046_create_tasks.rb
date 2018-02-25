class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.integer :strategy_id
      t.integer :user_phase_id
      t.string :name
      t.string :description

      t.string  :where
      t.string  :when
      t.string  :what

      t.string  :activity_amount
      t.string  :barriers
      t.string  :task_type
      t.string  :task_subtype

      t.datetime :created_at
      t.datetime :completed_at

      t.integer :duration

      t.integer :ppv

      t.boolean :remainder,   :default => true
      t.boolean :completed ,   :default => false

      t.timestamps
    end
  end
end
