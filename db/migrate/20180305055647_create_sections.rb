class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.string :title
      t.string :description

      t.integer :language_id
      t.integer :concept_id
    
      t.timestamps
    end
  end
end
