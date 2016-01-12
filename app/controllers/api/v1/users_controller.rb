module Api
  module V1
    class UsersController < Api::V1::BaseController
      before_action :doorkeeper_authorize!, except: :create
      respond_to :json

      def me
        render json: current_user
      end

      def create
        @user = User.create(user_params)
        respond_with @user, location: nil
      end

      private
      def user_params
        params.require(:data).require(:attributes).permit(:email, :password)
      end
    end
  end
end
