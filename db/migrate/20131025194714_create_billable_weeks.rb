class CreateBillableWeeks < ActiveRecord::Migration
  def change
    create_table :billable_weeks do |t|
      t.integer :total_hours
      t.references :timesheet, index: true

      t.timestamps
    end
  end
end
