class Admin::CoursesController < Admin::AdminController

  def index
    # # @courses = Course.all
    # @q = Course.search(params[:q])
    # @courses = @q.result(distinct: true)
    @courses = Course.arrange(order: :name)
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.create course_params
    respond_with(:admin,@course)
  end

  def edit
    @course = Course.find(params[:id])
    authorize @course
  end

  def update
    @course = Course.find(params[:id])
    authorize @course
    @course.update_attributes course_params
    respond_with(:admin,@course)
  end

  def destroy
    @course = Course.find(params[:id])
    authorize @course
    @course.destroy
    respond_with(:admin,@course)
  end


private

  def course_params
    params.require(:course).permit!
  end

end
