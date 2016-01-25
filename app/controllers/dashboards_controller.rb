class DashboardsController < ApplicationController
  def to_do
    @user = current_user

    redirect_to current_user unless @user.is_admin_of_anything?

    @due_submissions = @user.get_todo(Submission)
    @due_attendances = @user.get_todo(Attendance)
  end
end