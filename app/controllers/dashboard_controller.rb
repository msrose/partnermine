class DashboardController < ApplicationController
  def home
    redirect_to student_path(current_student)
  end
end
