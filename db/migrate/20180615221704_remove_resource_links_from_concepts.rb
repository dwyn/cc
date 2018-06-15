class RemoveResourceLinksFromConcepts < ActiveRecord::Migration[5.0]
  def change
    remove_column :concepts, :resource_links, :string
  end
end
