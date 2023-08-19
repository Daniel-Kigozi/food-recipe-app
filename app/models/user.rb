class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  ROLES = %w[user admin].freeze

  def admin?
    role == 'admin'
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :foods, class_name: 'Food', foreign_key: 'user_id'
  has_many :recipes, class_name: 'Recipe', foreign_key: 'user_id'

  validates :name, presence: true, length: { in: 2..200 }
end
