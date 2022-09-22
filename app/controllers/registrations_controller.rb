class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end
    def create
        # render plain: "Thanks!"
        # params ==>  Parameters: {"authenticity_token"=>"[FILTERED]", "user"=>{"email"=>"avdhu", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "commit"=>"Sign Up"}
        # render plain: params[:user]
        # {"email"=>"avdhu", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "commit"=>"Sign Up"}
        # @user = User.new(params[:user])
        @user = User.new(user_params)
        puts "parw23456543456434543234543 #{user_params}"
        if @user.save
            redirect_to_root_path, flash[:notice]= "Successfully created account"
        else
            flash[:alert] = "Something was wrong"
            render :new
            
        end
    end
    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
        # params[:user]        
    end
end