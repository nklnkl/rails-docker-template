class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: current_user, only: [
      :id, 
      :email,
      :sign_in_count,
      :current_sign_in_at,
      :last_sign_in_at,
      :current_sign_in_ip,
      :last_sign_in_ip
    ]
  end
end
