class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to employees_path
    else
      render :new
    end
  end

  def show
    @employee = Employee.find_by(id: params[:id])
  end

  def edit
    @employee = Employee.find_by(id: params[:id])
  end

  def update
    @employee = Employee.find_by(id: params[:id])

    if @employee.update(employee_params)
      redirect_to employees_path
    else
      render :edit
    end
  end

  def destroy
    @employee = Employee.find_by(id: params[:id])
    @employee.destroy
    redirect_to employees_path
  end

  def goodjob
    @employee = Employee.find_by(id: params[:id])
    @employee.good_job_logs.create(ip_address: request.remote_ip)
    redirect_to employees_path
  end

  private
  def employee_params
    params.require(:employee).permit(:name, :age, :tel, :email, :intro)
  end
end
