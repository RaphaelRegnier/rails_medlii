class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]
  has_many :instruments, through: :played_instruments
  has_many :played_instruments, dependent: :destroy

  has_many :conversations
  has_many :sent_messages, :class_name => "Message", :foreign_key => "user_1_id"
  has_many :received_messages, :class_name => "Message", :foreign_key => "user_2_id", through: :conversations

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  has_attachment :photo


  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      if auth.extra.raw_info.birthday
        user.birth_date = Date.strptime(auth.extra.raw_info.birthday, '%m/%d/%Y')
        user.age = (Date.today - Date.strptime(auth.extra.raw_info.birthday, '%m/%d/%Y')) / 365
      end
      ## call the public birthday from the facebook and calculate to the age
      # When the Date calculated by strptime method, it will give us the result with the days.
      # Divide by 365 is to calculate the exact person's age.
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

end
