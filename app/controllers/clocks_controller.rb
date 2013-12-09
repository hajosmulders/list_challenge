class ClocksController < ApplicationController
  def create
    @emp = Emp.find(params[:emp_id])
    @clock = @emp.clocks.create(params[:clock].permit(:clock_in, :clock_out))
    redirect_to emp_path(@emp)
  end
end