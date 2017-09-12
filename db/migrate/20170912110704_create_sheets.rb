class CreateSheets < ActiveRecord::Migration[5.1]
  def change
    create_table :sheets do |t|
      t.string :pol
      t.string :pod
      t.integer :rate_wm
      t.integer :rate_min
      t.integer :tt

      t.timestamps
    end
  end
end
