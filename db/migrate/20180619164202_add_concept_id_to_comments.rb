class AddConceptIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :concept_id, :integer
  end
end
