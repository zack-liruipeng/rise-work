class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
	 t.string  :article_type
	 t.integer :article_id
      t.string  :name
      t.string  :title
      t.text    :tags
      t.text    :description
      t.text    :content
      t.integer :author_id
      t.timestamps
    end
  end
end
