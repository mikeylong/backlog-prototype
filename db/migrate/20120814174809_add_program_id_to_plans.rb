class AddProgramIdToPlans < ActiveRecord::Migration
  def change
    add_column  :plans, :program_id, :integer
  end
end
