class CreateConceptJoins < ActiveRecord::Migration[5.0]
  def change
    create_table :concept_joins do |t|
      t.integer :user_id
      t.integer :concept_id
      t.integer :section_id
      t.integer :language_id

      t.timestamps
    end
  end
end
