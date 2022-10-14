class UsersController < ApplicationController
    def index
        check_status
    end
    def login
        # fail
        @user = User.where(email: params[:user][:email].downcase)
        if @user.length > 0 && @user.first.password == params[:user][:password]
            session[:id] = @user.first.id  
            redirect_to  '/subjects'
        else
            redirect_to '/login'
        end
    end
    def new
        check_status
    end
    def create
        user = User.new(user_params)
        if params[:password] == params[:password_confirmation] && user.save
            session[:id] = user.id 
            redirect_to '/subjects'
        else
            puts user.errors.full_messages
            redirect_to '/register'
        end
    end
    
    def show
        is_logged_in
        @user = User.find(session[:id])
    end

    def update_info
        user = User.find(session[:id]).update(name_params)
        redirect_to '/subjects'
    end

    def update_password
        user = User.find(session[:id])
        if user.password == params[:user][:old_password] && params[:user][:password] == params[:user][:password_confirmation]
            user.password = params[:user][:password]
            user.save
            redirect_to '/subjects'
        else
            puts user.errors.full_messages
            redirect_to '/profile'
        end
    end

    private
    def name_params 
        params.require(:user).permit(:first_name,:last_name)
    end
    
    def user_params
        params.require(:user).permit(:first_name, :last_name,:email,:password,:password_confirmation,:user_type)
    end
    def check_status
        if session[:id]
            redirect_to '/subjects'
        end
    end
    def is_logged_in
        if !session[:id]
            redirect_to '/login'
        end
    end
end
