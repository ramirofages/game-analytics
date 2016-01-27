class Level < ActiveRecord::Base
  has_many :checkpoints, dependent: :destroy
end
