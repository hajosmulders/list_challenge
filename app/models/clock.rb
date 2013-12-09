require 'date'

class Clock < ActiveRecord::Base
  belongs_to :emp
  
  def save
    if self.work_time==nil and self.clock_out!=nil
      self.work_time = DateTime.parse((self.clock_out-self.clock_in).to_s)
    end
   end
end
