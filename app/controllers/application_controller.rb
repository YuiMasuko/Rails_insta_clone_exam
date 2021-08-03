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
