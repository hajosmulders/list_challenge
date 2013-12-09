class EmpsController < ApplicationController
  def create
    @emp = Emp.new(emp_params)

    @emp.save
    redirect_to @emp
  end
  
  def show
    @emp = Emp.find(params[:id])
  end
  
  def edit
    @emp = Emp.find(params[:id])
  end
  
  def index
    @emps = Emp.all
  end
  
  private
  def emp_params
    params.require(:emp).permit(:first_name, :last_name, :role)
  end
end
