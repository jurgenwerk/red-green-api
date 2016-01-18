class Category < ActiveRecord::Base
  has_many :balance_change_categories
  has_many :balance_changes, through: :balance_change_categories
end
