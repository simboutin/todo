class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :set_password

  has_many :tasks, dependent: :destroy

  def password_required?
    new_record? ? false : super
  end

  def set_password
    self.password = '123456'
  end
end
