class Comment < ApplicationRecord
    belongs_to :board
    belongs_to :user

    validates :body, presence: true
    validates :body, length: { maximum: 65535 }
end
