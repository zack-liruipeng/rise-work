class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|

    t.integer  :survey_id

    t.string  :title
    t.string  :name
    t.string  :description

      t.timestamps
    end
  end
end
