class AddFavoritedToConcepts < ActiveRecord::Migration[5.0]
  def change
    add_column :concepts, :favorited, :boolean
  end
end
