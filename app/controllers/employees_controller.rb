class EmployeesController < ApplicationController
  before_action :find_employee, except: [:index, :new, :create]

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to employees_path, notice: 'Employee Created !'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update

    if @employee.update(employee_params)
      redirect_to employees_path, notice: 'Employee Updated !'
    else
      render :edit
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path, notice: 'Employee Deleted !'
  end

  def goodjob
    @employee.good_job_logs.create(ip_address: request.remote_ip)
    redirect_to employees_path, notice: 'Nice !'
  end

  private
  def employee_params
    params.require(:employee).permit(:name, :age, :tel, :email, :intro)
  end
  def find_employee
    @employee = Employee.find_by!(id: params[:id])
  end
end
