class ChangePlanIdToProgramIdInBacklog < ActiveRecord::Migration
  def change
    rename_column :backlogs, :plan_id, :program_id
  end
end
