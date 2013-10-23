class AddImageColumnToUsers < ActiveRecord::Migration
  def up
    add_column :users, :image_url, :string
  end

  def down
    remove_column :users, :image_url
  end
end
