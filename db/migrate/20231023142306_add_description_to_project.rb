class AddDescriptionToProject < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :description, :string
  end
end
