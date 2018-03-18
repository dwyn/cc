class CreateLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :languages do |t|
      t.string :name

      t.integer :section_id
      t.integer :concept_id

      t.timestamps
    end
  end
end
