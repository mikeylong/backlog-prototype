class DropBacklogs < ActiveRecord::Migration
  def up
    drop_table :backlogs
  end

  def down
    create_table :backlogs
  end
end
