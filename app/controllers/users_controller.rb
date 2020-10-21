class UsersController < ApplicationController
    before_action :authorize_request, except: :create
       
    def index
      @users = User.all
      render json: {data: @users, status: 200, message:"Success"}
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        render json: {data:@user, status: 200, message:"Success"}
      else
        render json: { errors: @user.errors.full_messages },
               status: :unprocessable_entity
      end
    end

    def user_params
        params.permit(
         :name, :username, :email, :password, :password_confirmation
        )
      end
  end