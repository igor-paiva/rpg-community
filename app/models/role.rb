class Role < ApplicationRecord
  belongs_to :user
  belongs_to :player, optional: true
  belongs_to :master, optional: true
end
