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

    has_many :sales, class_name: "Transaction", foreign_key: :seller_id
    has_many :sold_recipes, through: :sales, source: :recipe

    has_many :purchases, class_name: "Transaction", foreign_key: :buyer_id
    has_many :purchased_recipes, through: :purchases, source: :recipe

    scope :sellers, -> { joins(:sales) }
    scope :buyers, -> { joins(:purchases) }

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
