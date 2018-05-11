class AddColumnToConcepts < ActiveRecord::Migration[5.0]
  def change
    add_column :concepts, :section_id, :integer
  end
end
