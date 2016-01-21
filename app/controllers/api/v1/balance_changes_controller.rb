module Api
  module V1
    class BalanceChangesController < Api::V1::BaseController
      before_action :doorkeeper_authorize!

      def index
        render json: current_user.balance_changes
      end
    end
  end
end
