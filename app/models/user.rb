class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable

    validates :skill_level, inclusion: { in: 1..5 }
    validates :skill_level, numericality: { only_integer: true }
    
    validates :first_name, presence: true
    validates :last_name, presence: true

    has_many :recipes
    has_one :address, dependent: :destroy
    has_many :comments, as: :commentable

    accepts_nested_attributes_for :comments

    after_initialize do |user|
        unless user.skill_level
           user.skill_level = 1
        end
    end

    def full_name
        [ self.first_name, self.last_name ].join(' ')
    end
end
