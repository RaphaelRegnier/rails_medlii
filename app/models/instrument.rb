class Instrument < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :played_instruments
  has_many :users, through: :played_instruments

end
