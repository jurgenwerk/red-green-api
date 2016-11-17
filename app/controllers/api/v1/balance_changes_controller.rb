module Api
  module V1
    class BalanceChangesController < Api::V1::BaseController
      before_action :doorkeeper_authorize!
      before_action :find_balance_change, only: [:show, :update, :destroy]

      def index
        balance_changes =
          current_user.balance_changes

        filtered_balance_changes = apply_filters(balance_changes, params[:filter])

        render json: filtered_balance_changes.order("entry_date DESC")
      end

      def show
        render json: @balance_change
      end

      def update
        @balance_change.update(balance_change_params)
        if @balance_change.valid?
          render json: @balance_change
        else
          render json: ErrorSerializer.serialize(@balance_change.errors), status: :unprocessable_entity
        end
      end

      def create
        balance_change = current_user.balance_changes.create(balance_change_params)
        if balance_change.valid?
          render json: balance_change, status: :created
        else
          render json: ErrorSerializer.serialize(balance_change.errors), status: :unprocessable_entity
        end
      end

      def destroy
        @balance_change.destroy!
        render json: @balance_change
      end

      private
      def apply_filters(balance_changes, filter)        
        if filter.try!(:[], :period)
          date_parts = filter[:period].split("-")
          year = date_parts[0]
          month = date_parts[1]
          balance_changes
            .where('extract(year from entry_date) = ?', year)
            .where('extract(month from entry_date) = ?', month)
        else
          balance_changes
        end
      end

      def find_balance_change
        @balance_change = current_user.balance_changes.find(params[:id])
      end

      def balance_change_params
        params.require(:data).require(:attributes).permit(:value, :change_type, :entry_date)
      end
    end
  end
end
