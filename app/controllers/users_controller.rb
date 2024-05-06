class UsersController < ApplicationController

    def new
        redirect_to user_contacts_path(current_user) if user_signed_in?
        @user = User.new
      end
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Usuário criado com sucesso!"
            redirect_to root_url
        else
            render :new
        end
    end
    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
