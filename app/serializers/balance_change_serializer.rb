class BalanceChangeSerializer < ActiveModel::Serializer
  attributes :value, :change_type, :created_at
end
