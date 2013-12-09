class CreateClocks < ActiveRecord::Migration
  def change
    create_table :clocks do |t|
      t.timestamp :clock_in
      t.timestamp :clock_out
      t.integer :work_time
      t.references :emp, index: true

      t.timestamps
    end
  end
end
