class User < ApplicationRecord
    has_many :food, dependent: :delete_all
    has_many :recipe, dependent: :delete_all

    validates :name, presence: true
end
