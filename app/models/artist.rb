class Artist < ApplicationRecord
    validates :name, presence: true

    has_one_attached :avatar
    has_one_attached :cover_photo
end
