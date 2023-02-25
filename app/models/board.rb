class Board < ApplicationRecord
    belongs_to :user
    has_many :bookmarks, dependent: :destroy
    has_many :users, through: :bookmarks
    has_many :comments, dependent: :destroy
    
    validates :title, presence: true
    validates :title, length: {maximum: 255 }
    validates :body, presence: true
    validates :body, length: { maximum: 65535 }
    mount_uploader :board_image, BoardImageUploader

end
