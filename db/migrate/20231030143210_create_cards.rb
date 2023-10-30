class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.string :content
      t.string :status
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
