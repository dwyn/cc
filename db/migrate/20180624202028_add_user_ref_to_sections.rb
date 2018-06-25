class AddUserRefToSections < ActiveRecord::Migration[5.0]
  def change
    add_reference :sections, :user, foreign_key: true
  end
end
