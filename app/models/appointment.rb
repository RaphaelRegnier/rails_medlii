class Appointment < ApplicationRecord
  belongs_to :user, :foreign_key => "user_id"
  belongs_to :conversation

  def other_user
    User.find(user_2_id)
  end
end
