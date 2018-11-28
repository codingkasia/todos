class SessionsController < ApplicationController
    
    def new
 
    end

    def create
        sign_in_as params[:session][:email]
        redirect_to root_path
    end

    private

    def sign_in_as(email)
        session[:current_email] = email
    end

end
