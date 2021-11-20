class Artist < ApplicationRecord
    validates :name, :permalink, :bio, :formed_at, :verified, presence: true

end
