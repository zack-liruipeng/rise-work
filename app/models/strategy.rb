class Strategy < ActiveRecord::Base
  attr_accessible :strategy_id,:strategy_subtype, :strategy_type, :phase_id, :name, :title, :tags, :description, :content,:where,:when,:what, :map_image_url, :map_url

has_and_belongs_to_many :phases

end

     
