class User < ActiveRecord::Base
  has_many :leagues, foreign_key: 'administrator_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  validates :password_confirmation, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true, if: -> { email.present? }
end
