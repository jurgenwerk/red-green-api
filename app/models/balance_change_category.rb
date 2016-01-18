class BalanceChangeCategory < ActiveRecord::Base
  belongs_to :balance_change
  belongs_to :category
end
