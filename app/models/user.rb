class User < ApplicationRecord
    validates :skill_level, inclusion: { in: 1..5 }
    validates :skill_level, numericality: { only_integer: true }

    def initialize(args)
        super
        self.skill_level = 1
    end
end
