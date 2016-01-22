class BalanceChange < ActiveRecord::Base
  has_many :balance_change_categories
  has_many :categories, through: :balance_change_categories
  enum change_type: [:income, :expense]
  validates :value, presence: true
  validates_numericality_of :value
end
