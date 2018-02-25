class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
   	  t.integer :status_id
   	  t.string  :name
   	  t.text    :description
      t.timestamps
    end
  end
end
