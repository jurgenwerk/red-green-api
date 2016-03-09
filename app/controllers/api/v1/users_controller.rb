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
          insert_sample_data(user) if ENV["SAMPLE_DATA_ON_SIGNUP"]
          render json: user, status: :ok
        else
          render json: ErrorSerializer.serialize(user.errors), status: :unprocessable_entity
        end
      end

      def update
        current_user.assign_attributes(user_params.slice(:email, :currency))
        if current_user.save
          render json: current_user, status: :ok
        else
          render json: ErrorSerializer.serialize(current_user.errors), status: :unprocessable_entity
        end
      end

      private
      def user_params
        params.require(:data).require(:attributes).permit(:email, :password, :currency)
      end

      def insert_sample_data(user)
        3.times do
          user.balance_changes.create!(entry_date: Date.today, value: rand(1300..2000)*100, change_type: :income)
          user.balance_changes.create!(entry_date: Date.today, value: rand(1300..2000)*100, change_type: :expense)
        end
      end
    end
  end
end
