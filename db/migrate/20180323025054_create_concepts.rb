class CreateConcepts < ActiveRecord::Migration[5.0]
  def change
    create_table :concepts do |t|
      t.string :title
      t.string :description
      t.string :resource_links
      t.integer :user_id
      t.boolean :submitted

      t.timestamps
    end
  end
end
