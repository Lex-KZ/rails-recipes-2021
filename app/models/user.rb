class User < ApplicationRecord
    validates :skill_level, inclusion: { in: 1..5 }
    validates :skill_level, numericality: { only_integer: true }

    has_many :recipes

    after_initialize do |user|
        user.skill_level ||= 1
    end
end
