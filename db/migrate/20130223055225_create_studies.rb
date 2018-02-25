class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
	  t.integer :study_id
      t.string  :study_type
      t.string  :name
      t.text    :description
      t.integer :duration_in_days
      t.string  :study_secret_key
      t.timestamps
    end
  end
end
