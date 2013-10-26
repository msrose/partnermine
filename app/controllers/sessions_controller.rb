class SessionsController < ApplicationController
  def new
    redirect_to student_url(current_student) if signed_in?
  end

  def create
    student = Student.find_by_email(params[:session][:email].downcase)
    if student && student.authenticate(params[:session][:password])
      flash[:success] = 'Sign in successful.'
      sign_in(student)
      self.current_student = student
      redirect_to student_url(student)
    else
      flash[:error] = 'Invalid email/password combination.'
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to signin_path
  end
end
