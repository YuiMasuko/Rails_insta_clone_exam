class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :login_required
  before_action :forbid_login_user
  private
  def login_required
    redirect_to new_session_path unless current_user
    end
    def forbid_login_user
      if @current_user
      flash[:notice] = "ログインしています"
      else
      flash[:notice] = "ログインしていません"
      end
    end
  end
  def authenticate_user
    if logged_in?
      unless current_user.id == @picture.user_id
        flash[:notice] = "権限がありません。"
        redirect_to pictures_path
      end
    else
      redirect_to new_user_path, notice:"ログインが必要です"
    end
  end
  def ensure_current_user
    if logged_in?
      unless current_user.id == params[:id].to_i
        flash[:notice] = "権限がありません。"
        redirect_to pictures_path
      end
    else
      redirect_to new_user_path, notice:"ログインが必要です"
    end
  end
