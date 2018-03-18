class AddSubmittedToConcepts < ActiveRecord::Migration[5.0]
  def change
    add_column :concepts, :submitted, :boolean,  default: false
  end
end
