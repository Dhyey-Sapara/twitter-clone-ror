module Authenticate
  extend ActiveSupport::Concern
  include Redirection

  def login(user)
    reset_session
    session[:current_user_id] = user.id
  end

  def logout
    reset_session
  end

  def forget(user)
    cookies.delete :remember_token
    regenerate_remember_token(user)
  end

  def remember(user)
    regenerate_remember_token(user)
    cookies.permanent.encrypted[:remember_token] = user.remember_token
  end

  private

  def current_user
    @current_user ||= if session[:current_user_id].present?
                        User.find_by(id: session[:current_user_id])
                      elsif cookies.permanent.encrypted[:remember_token].present?
                        User.find_by(remember_token: cookies.permanent.encrypted[:remember_token])
                      end
  end

  def user_signed_in?
    @current_user.present?
  end

  def regenerate_remember_token(user)
    user.remember_token = user.secure_remember_token
    user.save(validate: false)
  end
end
