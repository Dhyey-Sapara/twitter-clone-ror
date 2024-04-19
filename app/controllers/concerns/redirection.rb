module Redirection
  extend ActiveSupport::Concern

  def redirect_if_authenticated
    redirect_to root_path, alert: 'You are already logged in.' if user_signed_in?
  end

  def redirect_if_not_logged_in
    redirect_to root_path, alert: 'Please login to continue' if !user_signed_in?
  end
end
