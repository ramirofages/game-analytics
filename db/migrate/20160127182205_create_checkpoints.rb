class CreateCheckpoints < ActiveRecord::Migration
  def change
    create_table :checkpoints do |t|
      t.integer :number
      t.integer :activationCount
      t.references :level, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
