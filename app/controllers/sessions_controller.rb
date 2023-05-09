# frozen_string_literal: true

class SessionsController < ApplicationController
  #   before_action :require_no_authentication, only: %i[new create]
  #   before_action :require_authentication, only: :destroy
  before_action :set_user, only: :create

  def new; end

  def create
    if @user
      sign_in @user
      flash[:success] = "Добро пожаловать, #{params[:name]}"
      redirect_to root_path
    else
      flash[:warning] = 'Пользователь не найден'
      redirect_to new_session_path
    end
  end

  def destroy
    sign_out
    flash[:success] = ''
    redirect_to root_path, status: :see_other
  end

  private

  def set_user
    @user = User.find_by name: params[:name]
  end
end
