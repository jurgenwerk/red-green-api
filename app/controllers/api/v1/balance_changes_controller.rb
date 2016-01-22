module Api
  module V1
    class BalanceChangesController < Api::V1::BaseController
      before_action :doorkeeper_authorize!

      def index
        render json: current_user.balance_changes
      end

      def create
        balance_change = current_user.balance_changes.create(balance_change_params)
        if balance_change.valid?
          render json: balance_change, status: :created
        else
          render json: ErrorSerializer.serialize(balance_change.errors), status: :unprocessable_entity
        end
      end

      private
      def balance_change_params
        params.require(:data).require(:attributes).permit(:value, :change_type)
      end
    end
  end
end
