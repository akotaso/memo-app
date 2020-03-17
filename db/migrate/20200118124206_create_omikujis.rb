class CreateOmikujis < ActiveRecord::Migration[5.0]
  def change
    create_table :omikujis do |t|

      t.timestamps
    end
  end
end
