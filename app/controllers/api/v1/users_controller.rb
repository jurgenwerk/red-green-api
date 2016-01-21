module Api
  module V1
    class UsersController < Api::V1::BaseController
      before_action :doorkeeper_authorize!, except: :create

      def me
        render json: current_user
      end

      def create
        user = User.create(user_params)
        if user.save
          render json: user, status: :ok
        else
          render json: ErrorSerializer.serialize(user.errors), status: :unprocessable_entity
        end
      end

      private
      def user_params
        params.require(:data).require(:attributes).permit(:email, :password)
      end
    end
  end
end
