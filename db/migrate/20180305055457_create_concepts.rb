class CreateConcepts < ActiveRecord::Migration[5.0]
  def change
    create_table :concepts do |t|
  	t.integer  "user_id"
  	t.integer  "language_id"
    t.integer  "section_id"
    
    t.string   "title"
    t.string   "description"
    t.string   "resource_links"

      t.timestamps
    end
  end
end
