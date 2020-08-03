class Flight < ApplicationRecord
  validates_presence_of :number

  belongs_to :airline
end
