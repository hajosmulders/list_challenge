class FrontpageController < ApplicationController
  def index
    if params[:login] != nil
      @emp = Emp.find_by login: params[:login]
      if @emp == nil
        redirect_to "/"
      else
        redirect_to "/clocker/"+@emp.id.to_s()
      end
    end
  end
  
  def destroy
    @emp = Emp.find(params[:emp_id])
    @emp.destroy
    redirect_to "/emps/"
  end
  
  def clocker
    @emp = Emp.find(params[:emp_id])
    @clock = @emp.clocks.last
    if @clock == nil
      redirect_to "/clock_in/"+params[:emp_id].to_s()
    else
      if @clock.clock_out == nil
        redirect_to "/clock_out/"+params[:emp_id].to_s()
      else
        redirect_to "/clock_in/"+params[:emp_id].to_s()
      end
    end
  end
  
  def clock_in
    @emp = Emp.find(params[:emp_id])
    @clock = Clock.new
    @clock.clock_in = Time.now
    @clock.emp_id = @emp.id
    @clock.save!
    if @emp.role == "admin"
      @all_clocks = Clock.all
    end
  end
  
  def clock_out
    @emp = Emp.find(params[:emp_id])
    @clock = @emp.clocks.last
    @clock.clock_out = Time.now
    @clock.save!
  end
    
end
