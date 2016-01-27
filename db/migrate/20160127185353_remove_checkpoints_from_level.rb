class RemoveCheckpointsFromLevel < ActiveRecord::Migration
  def change
  	remove_foreign_key :level, :checkpoint
  end
end
