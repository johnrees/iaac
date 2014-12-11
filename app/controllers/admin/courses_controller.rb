class Admin::CoursesController < Admin::AdminController

  def index
    # # @courses = Course.all
    # @q = Course.search(params[:q])
    # @courses = @q.result(distinct: true)
    @courses = Course.arrange(order: :name)
  end

  def show
    @course = Course.includes(:students,:tutor_members => :user).find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.create course_params
    respond_with(:admin,@course)
  end

  def edit
    @course = Course.includes(:tutor_members,:students).find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    @course.update_attributes course_params
    respond_with(:admin,@course)
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    respond_with(:admin,@course)
  end


private

  def course_params
    params.require(:course).permit!
  end

end
