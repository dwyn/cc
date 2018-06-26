class AddFavoriteSectionToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :favorite_section, :integer
  end
end
