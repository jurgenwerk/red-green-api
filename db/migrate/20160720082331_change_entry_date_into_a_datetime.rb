class ChangeEntryDateIntoADatetime < ActiveRecord::Migration
  def change
    change_column :balance_changes, :entry_date, :datetime
  end
end
