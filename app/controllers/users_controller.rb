class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome #{@user.username} to the Alpha Blog"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update

      if @user.update(user_params)
        flash[:notice]= 'Your account information was updated successfully updated.'
        redirect_to articles_path
      else
        render :edit
      end

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end