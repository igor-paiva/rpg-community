class Role < ApplicationRecord
  belongs_to :user
  belongs_to :player
  belongs_to :master
end
