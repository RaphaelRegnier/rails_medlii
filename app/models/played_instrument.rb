class PlayedInstrument < ApplicationRecord
  belongs_to :user
  belongs_to :instrument
  validates_uniqueness_of :user_id, scope: :instrument_id
  validates :level, presence: true,  inclusion: { in: (1..5), allow_nil: false }
  validates :instrument, :user, presence: true

end
