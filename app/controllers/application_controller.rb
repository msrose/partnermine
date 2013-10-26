class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :sign_in, :sign_out, :current_user, :signed_in?

  protected

    def sign_in
      token = Student.new_remember_token
      cookies[:remember_token] = token
      user.update_attribute(:remember_token, Student.encrypt(token))
    end

    def sign_out
      self.current_user = nil
      cookies.delete(:remember_token)
    end

    def current_user
      remember_token = Student.encrypt(cookies[:remember_token])
      @current_user ||= Student.find_by_remember_token(remember_token)
    end

    def current_user=(user)
      @current_user = user
    end

    def signed_in?
      current_user.present?
    end
end
