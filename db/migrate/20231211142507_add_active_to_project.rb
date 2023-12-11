class AddActiveToProject < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :active, :boolean, default: true
  end
end
