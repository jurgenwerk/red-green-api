class CreateBalanceChangeCategories < ActiveRecord::Migration
  def change
    create_table :balance_change_categories do |t|
      t.references :balance_change
      t.references :category
      t.timestamps null: false
    end

    add_foreign_key :balance_change_categories, :balance_changes, on_delete: :cascade
    add_foreign_key :balance_change_categories, :categories, on_delete: :cascade
    add_index :balance_change_categories, [:balance_change_id, :category_id], unique: true, name: 'balance_change_categories_index'
  end
end
