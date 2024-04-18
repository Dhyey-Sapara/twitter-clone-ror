module Redirection
  extend ActiveSupport::Concern

  def redirect_if_authenticated
    redirect_to root_path, alert: 'You are already logged in.' if user_signed_in?
  end
end
