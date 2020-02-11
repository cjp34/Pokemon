class Pokemon < ActiveRecord::Base
    has_many :parties
    has_many :trainers, through: :parties
end