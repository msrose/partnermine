class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :sign_in, :sign_out, :current_student, :signed_in?

  protected

    def sign_in(student)
      token = Student.new_remember_token
      cookies[:remember_token] = token
      student.update_attribute(:remember_token, Student.encrypt(token))
    end

    def sign_out
      self.current_student = nil
      cookies.delete(:remember_token)
    end

    def current_student
      remember_token = Student.encrypt(cookies[:remember_token])
      @current_student ||= Student.find_by_remember_token(remember_token)
    end

    def current_student=(student)
      @current_student = student
    end

    def signed_in?
      current_student.present?
    end

    def require_signed_in_student
      redirect_to signin_url unless signed_in?
    end
end
