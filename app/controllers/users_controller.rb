class UsersController < ApplicationController
  before_action :load_user, exept: [ :index, :create, :new ]

  before_action :authorize_user, exept: [ :index, :create, :new, :show ]
  def index
   @users = User.all
  end

  def new
    redirect_to root_url, alert: "You are logined already" if current_user.present?

    @user = User.new
  end

  def create
    redirect_to root_url, alert: "You are logined already" if current_user.present?

    @user = User.new(user_params)
    # @user = User.new(params[:user])

    if @user.save
      redirect_to root_url, notice: "User registered successfully"
    else
      render "new"
    end
  end

  def edit
    # @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.update
      redirect_to user_path(@user), notice: "Data updated"
    else
      render "edit"
    end
  end

  def show
    @user = User.find(params[:id])
    @questions = @user.questions.prder(created_at: :desc)

    @new_question = @user.questions.build
  end

  private

  def authorize_user
    reject_user unless @user = current_user
  end

  def load_user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                 :name, :user_name, :avatar_url)
  end
end
