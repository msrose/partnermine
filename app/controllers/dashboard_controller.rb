class DashboardController < ApplicationController
  def home
    if signed_in?
      redirect_to student_path(current_student)
    else
      redirect_to signin_path
    end
  end
end
