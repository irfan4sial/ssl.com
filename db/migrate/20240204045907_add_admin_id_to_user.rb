class AddAdminIdToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin_id, :integer
    add_column :teams, :admin_id, :integer
    add_column :roles, :admin_id, :integer
  end
end
