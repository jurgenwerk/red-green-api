module Api
  module V1
    class UsersController < Api::V1::BaseController
      before_action :doorkeeper_authorize!

      def me
        render json: current_user
      end

      def create
        @user = User.create!(params[:user])
        respond_with @user, location: nil
      end
    end
  end
end
