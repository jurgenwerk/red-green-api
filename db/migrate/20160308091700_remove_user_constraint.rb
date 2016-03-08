class RemoveUserConstraint < ActiveRecord::Migration
  def change
    change_column :balance_changes, :user_id, :integer, null: true
    remove_foreign_key :balance_changes, :users
  end
end
