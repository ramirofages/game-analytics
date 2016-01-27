class RemoveCheckpointsFromLevelAgain < ActiveRecord::Migration
  def change
    remove_reference :levels, :checkpoint, index: true, foreign_key: true
  end
end
