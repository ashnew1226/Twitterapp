class PasswordResetsController < ApplicationController
    def new
        
    end
    def create
        @user = User.find_by(email: params[:email])
        # send mail
        if @user.present?
            # send eamil
            PasswordMailer.with(user: @user).reset.deliver_now

        end
        redirect_to root_path, notice: "If an account with that email was found, we have sent the link to reset your password"
         
    end

    def edit
        @user = User.find_signed!(params[:token], purpose: "password_reset") #if you cant verify that token User.find_signed! method throws an exception
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to sign_in_path, alert: "Your token has expired. Please try again"    
        # binding.irb #used to inspect that user is exists or not but because of token is expired the user is nil.    
    end

    def update
        @user = User.find_signed!(params[:token], purpose: "password_reset")
        if @user.update(password_params)
            redirect_to sign_in_path, notice: "Your password was reset successfully. please sign in"
        else
            render :edit
            
        end
    end

    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
        
    end
end
