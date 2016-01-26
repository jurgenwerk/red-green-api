module Api
  module V1
    class BalanceChangesController < Api::V1::BaseController
      before_action :doorkeeper_authorize!

      def index
        date_parts = params[:filter][:period].split("-")
        year = date_parts[0]
        month = date_parts[1]

        balance_changes =
          current_user
          .balance_changes
          .where('extract(year from created_at) = ?', year)
          .where('extract(month from created_at) = ?', month)

        render json: balance_changes
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
