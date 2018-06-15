class RemoveSubmittedSatusFromConcepts < ActiveRecord::Migration[5.0]
  def change
    remove_column :concepts, :submitted, :boolean
  end
end
