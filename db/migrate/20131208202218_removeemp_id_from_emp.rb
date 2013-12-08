class RemoveempIdFromEmp < ActiveRecord::Migration
  def change
    remove_column :emps, :emp_id
  end
end
