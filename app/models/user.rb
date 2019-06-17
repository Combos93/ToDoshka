class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks, dependent: :destroy

  validates :email, :nickname, presence: true
  validates :email, :nickname, uniqueness: true

  # Валидация максимальной длины ника - 40 символов
  validates :nickname, length: { maximum: 40}

  # Валидация ника - на наличие только букв, цифр и символа '_'
  validates_format_of :nickname, :with => /\A[a-z0-9_]*\z/

  # Валидация e-mail`a - на верный ввод почты.
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/
end
