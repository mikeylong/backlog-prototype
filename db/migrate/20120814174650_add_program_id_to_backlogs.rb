class AddProgramIdToBacklogs < ActiveRecord::Migration
  def change
    add_column  :backlogs, :plan_id, :integer
  end
end
