class Wod < ActiveRecord::Base
  belongs_to :user
  has_many :movemets
end
