class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  protect_from_forgery :except => [:destroy]

  def index
    @students = Student.order("created_at DESC")
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless @student.user_id == current_user.id
      redirect_to students_path
    end
  end

  def update
    if @student.update(student_params)
      redirect_to student_path(student_params)
    else
      render :edit
    end
  end

  def destroy
    if @student.user_id == current_user.id
      @student.destroy
      redirect_to students_path
    else
      redirect_to root_path
    end
  end

  private

  def student_params
    params.require(:student).permit(:rank_id, :kill_rate, {:character => []}, :play_style, :play_time, {:play_device => []}, {:communication_tool => []}, :price, :times_to_teach, :enthusiasm_text).merge(user_id: current_user.id)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end
