class ApplicationController < ActionController::Base
    include Authenticate
    before_action :current_user
    helper_method :current_user
    helper_method :user_signed_in?
end
