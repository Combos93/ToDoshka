class AddbgColorToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :bg_color, :string, :default => "#808080"
    add_column :users, :color, :string, :default => "#fff"
  end
end
