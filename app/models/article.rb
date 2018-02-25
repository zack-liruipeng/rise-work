class Article < ActiveRecord::Base
  attr_accessible :name,:title, :tags, :description, :author_id,:content,:article_id
end
