class PhotoShout < ApplicationRecord
  has_one_attached :image
  # has_attached_file :image, styles: { thumb: "200x200" }
  # validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf"]
end
