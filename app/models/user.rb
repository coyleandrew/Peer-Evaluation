class User < ApplicationRecord
    has_many :class_rosters
    has_many :faculties
    has_many :evaluations
end
