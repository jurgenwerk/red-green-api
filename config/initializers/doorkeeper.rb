Doorkeeper.configure do
  # Change the ORM that doorkeeper will use.
  # Currently supported options are :active_record, :mongoid2, :mongoid3, :mongo_mapper
  orm :active_record

  use_refresh_token

  resource_owner_from_credentials do |routes|
    user = User.find_by_email(params[:username])
    user.authenticate(params[:password]) if user
  end


  access_token_expires_in 2.hours
end

Doorkeeper.configuration.token_grant_types << "password"
