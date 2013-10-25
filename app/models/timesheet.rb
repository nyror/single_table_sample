class Timesheet < ActiveRecord::Base 
  def billable_hours_outstanding
    if submitted?
      billable_weeks.map(&:total_hours).sum
    else
      0
    end
  end

  # non-relevant code ommitted
  def self.billable_hours_outstanding_for(user)   
    user.timesheets.map(&:billable_hours_outstanding).sum
  end 
end

class DraftTimesheet < Timesheet
  def billable_hours_outstanding
    0
  end
end

class SubmittedTimesheet < Timesheet
  def billable_hours_outstanding
    billable_weeks.map(&:total_hours).sum
  end
end

class PaidTimesheet < Timesheet 
  
  def billable_hours_outstanding
    paid_hours = 5
    billable_weeks.map(&:total_hours).sum - paid_hours 
  end
end
