class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.integer :number
      t.references :checkpoint, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
