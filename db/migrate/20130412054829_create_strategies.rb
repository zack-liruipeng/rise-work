class CreateStrategies < ActiveRecord::Migration
  def change
    create_table :strategies do |t|
      
      t.integer :strategy_id
      t.string  :strategy_type
      t.string  :strategy_subtype
      t.integer :phase_id

      t.string  :map_image_url
      t.string  :map_url
      
      t.string  :name
      t.string  :title
      t.text    :tags
      t.text    :description
      t.text    :content

      t.string  :where
      t.string  :when
      t.string  :what

      t.timestamps
    end

    create_table :phases_strategies do |t|
      t.belongs_to :strategy
      t.belongs_to :phase
    end

  end
end
