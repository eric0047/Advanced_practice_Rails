class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to students_path, notice: 'Student Joined'
    else
      render :new
    end
  end

  def show
    @student = Student.find_by(id: params[:id])
  end

  def edit
    @student = Student.find_by(id: params[:id])
  end

  def update
    @student = Student.find_by(id: params[:id])

    if @student.update(student_params)
      redirect_to students_path, notice: 'Student Updated'
    else
      render :edit
    end
  end

  def destroy
    @student = Student.find_by(id: params[:id])
    @student.destroy
    redirect_to students_path, notice: 'Student destroyed'
  end

  private
  def student_params
    params.require(:student).permit(:name, :age, :city)
  end
end
