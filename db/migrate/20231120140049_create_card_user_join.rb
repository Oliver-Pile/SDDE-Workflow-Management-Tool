class CreateCardUserJoin < ActiveRecord::Migration[7.1]
  def change
    create_join_table :cards, :users
  end
end
