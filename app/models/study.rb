class Study < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessible :study_id,:study_type,:name,:description,:duration_in_days,:study_secret_key

  has_many :phases
  has_many :user_studies
  has_many :users, :through => :user_studies

end
