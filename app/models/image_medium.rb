class ImageMedium < Medium
  include FileAttachmentModule

  # ==== ATTACHMENTS ====
  # Has an associated image.
  mount_uploader :image, ImageUploader

  # ==== VALIDATIONS ====
  validates_presence_of :image_attachment

end