class AddDescriptionToObjective < ActiveRecord::Migration
  def change
    add_column :objectives, :description, :string
  end
end
