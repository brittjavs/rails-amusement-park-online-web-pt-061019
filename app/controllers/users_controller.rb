class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
            # binding.pry
        else
            render :new
        end
    end

    def show
        @user = User.find_by(params[:id])
        if session[:user_id] != @user.id
            redirect_to "/"
        end
    end


    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end
end