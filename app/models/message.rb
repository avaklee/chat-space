class Message < ApplicationRecord
belongs_to :user
belongs_to :group
validates :body, :image, presence: true
validates :body, presence: true, if: -> { image.blank? }
validates :image, presence: true, if: -> { body.blank? }
mount_uploader :image, ImageUploader
end
