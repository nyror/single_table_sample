class BillableWeek < ActiveRecord::Base
  belongs_to :timesheet
end
