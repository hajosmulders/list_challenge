class AddLoginToEmps < ActiveRecord::Migration
  def change
    add_column :emps, :login, :string
  end
end
