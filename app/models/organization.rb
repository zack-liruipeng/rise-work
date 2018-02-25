class Organization < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :organization_id, :organization_type, :name, :address, :city,:province,:country,:postal_code,:time_zone,:licenses,:note,:secret_key

  has_many :users
end
