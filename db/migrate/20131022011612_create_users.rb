class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :facebook_id
      t.string :status
      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
