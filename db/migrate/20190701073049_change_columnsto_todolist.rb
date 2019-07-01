class ChangeColumnstoTodolist < ActiveRecord::Migration[5.2]
  def change
    change_column(:todolists, :pincode, :string)
  end

  def self.up
    change_column :todolists, :pincode, :string
  end

  def self.down
    change_column :todolists, :pincode, :integer
  end
end
