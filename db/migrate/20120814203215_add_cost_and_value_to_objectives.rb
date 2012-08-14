class AddCostAndValueToObjectives < ActiveRecord::Migration
  def change
    add_column :objectives, :cost, :integer
    add_column :objectives, :value, :integer
  end
end
