class Appointment < ApplicationRecord
  belongs_to :user, :foreign_key => "user_id"
  belongs_to :conversation
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def other_user
    User.find(user_2_id)
  end
end
