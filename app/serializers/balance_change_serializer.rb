class BalanceChangeSerializer < ActiveModel::Serializer
  attributes :value, :change_type, :entry_date, :created_at
end
