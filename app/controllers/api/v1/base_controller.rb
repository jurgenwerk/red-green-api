module Api
  module V1
    class BaseController < ApplicationController
      def index
        render text: "Red Gren API"
      end

    private
      def current_user
        @current_user ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
      end
    end
  end
end
