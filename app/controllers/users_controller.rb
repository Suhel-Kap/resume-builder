class UsersController < ApplicationController
    def new
        @user = User.new
        @profile = Profile.new
    end    

    def create
        @user = User.new(user_params)
        @profile = Profile.new
    
        if @user.save
          flash[:success] = "You are registered"
    
          #associate profile
          @profile.user = @user
          @profile.save
    
          session[:user_id] = @user.id
          session[:profile_id] = @profile.id
          redirect_to edit_path
        else
          render :new
        end
      end

    private 
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end