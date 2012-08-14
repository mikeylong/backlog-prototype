class AddBacklogIdToObjectives < ActiveRecord::Migration
  def change
    add_column :objectives, :backlog_id, :integer
  end
end
