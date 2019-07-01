class Todolist < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :title, presence: true

  def pincode_valid?(pin)
    pincode == pin
  end
end
