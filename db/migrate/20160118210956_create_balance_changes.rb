class CreateBalanceChanges < ActiveRecord::Migration
  def change
    create_table :balance_changes do |t|
      t.references :user, null: false
      t.float :value, null: false
      t.integer :change_type, null: false, default: 0
      t.date :entry_date, null: false
      t.timestamps null: false
    end

    add_foreign_key :balance_changes, :users, on_delete: :cascade
  end
end
