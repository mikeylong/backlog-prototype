class AddPlanIdToProjects < ActiveRecord::Migration
  def change
    add_column  :projects, :plan_id, :integer
  end
end
