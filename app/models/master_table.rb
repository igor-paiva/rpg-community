class MasterTable < ApplicationRecord
  belongs_to :table
  belongs_to :master

end
