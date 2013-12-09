class FrontpageController < ApplicationController
  def index
    if params[:emp_id] != nil
      @emp = Emp.find(params[:emp_id])
      redirect_to "/clocker/"+params[:emp_id].to_s()
    end
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
    @clock = Clock.new#create(clock_in: Time.now, emp_id: @emp.id)
    @clock.clock_in = Time.now
    @clock.emp_id = @emp.id
    @clock.save!
  end
  
  def clock_out
    @emp = Emp.find(params[:emp_id])
    @clock = @emp.clocks.last
    @clock.clock_out = Time.now
    @clock.save!
  end
    
end
