class CreateEmps < ActiveRecord::Migration
  def change
    create_table :emps do |t|
      t.string :first_name
      t.string :last_name
      t.string :role
      t.string :emp_id

      t.timestamps
    end
  end
end
