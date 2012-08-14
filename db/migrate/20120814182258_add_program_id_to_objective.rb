class AddProgramIdToObjective < ActiveRecord::Migration
  def change
    add_column :objectives, :program_id, :integer
  end
end
