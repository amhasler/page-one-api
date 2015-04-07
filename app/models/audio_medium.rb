class AudioMedium < Medium
  # ==== ATTACHMENTS ====
  mount_uploader :audio_attachment, AudioUploader

  # ==== VALIDATIONS ====
  validates_presence_of :audio_attachment
  validates :caption, presence: true, length: {maximum: 140}

end