class RegistrationController < ApplicationController
def sign_up
end

def register
    email = params[:email]
    password = params[:password]
    if User.find_by(email: email) || password == ""
        if password == ""
            flash.now[:alert] = 'Password is required'
        else
            flash.now[:alert] = 'User already exists'
        end
        render "sign_up"
    else
        user = User.new
        user.email = email
        user.admin = false
        user.password = password
        respond_to do |format|
            if user.save
            session[:user_id] = user.id
            format.html { redirect_to root_url, notice: 'User was successfully created.' }
            format.json { render :show, status: :created, location: @user }
            else
            format.html { render :register }
            format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end
end

end