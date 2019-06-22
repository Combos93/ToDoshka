class AddColumnstoTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :description, :text

    add_reference :tasks, :todolist, foreign_key: true
    add_reference :tasks, :user, foreign_key: true
  end
end
