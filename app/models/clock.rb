require 'date'

class Clock < ActiveRecord::Base
  belongs_to :emp
  
  before_save :set_worktime
  
  private
    def set_worktime
      if self.work_time==nil 
        if self.clock_out!=nil
          self.work_time = (self.clock_out-self.clock_in).to_i()
        end
      end
    end
end
