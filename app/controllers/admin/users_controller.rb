class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :only_admin

  def index
    @users = Admin::User.includes(:tasks)
  end

  def new
    @user = Admin::User.new
  end

  def create
    @user = Admin::User.new(get_params)
    @user.save(validate: false)
    redirect_to admin_users_path, success: "Utilisateur créé"
  end

  def show

  end

  def edit
    
  end

  def update
    @user.update_attributes(get_params)
    if @user.save
      redirect_to admin_users_path, success: "Utilisateur mis à jour"
    else
      render 'edit'
    end
  end

  def destroy
    if(current_user.id != @user.id)
      @user.destroy
      redirect_to admin_users_path, success: "Utilisateur supprimé"
    else
      redirect_to admin_users_path, danger: "Impossible de supprimer cet utilisateur"
    end
    
  end

  private 
  def set_user
    @user = Admin::User.includes(:tasks).find(params[:id])
  end

  def get_params
    params.require(:admin_user).permit(:username, :email, :password, 
      :password_confirmation, :firstname, :lastname, :role)
  end

end
