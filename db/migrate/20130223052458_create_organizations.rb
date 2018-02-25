class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
 	    t.integer :organization_id
      t.string :organization_type
      t.string :name
      t.string :address
      t.string :city
      t.string :province
      t.string :country
      t.string :postal_code
      t.string :time_zone
      t.integer :licenses
      t.string :secret_key
      t.text :note
      t.timestamps
    end
  end
end
