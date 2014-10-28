class Admin::CoursesController < Admin::AdminController

  def index
    @courses = Course.all
  end

private

  def course_params
    params.require(:course).permit!
  end

end
