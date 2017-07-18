class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :instruments, through: :played_instruments
  has_many :played_instruments, dependent: :destroy
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  has_attachment :photo
end
