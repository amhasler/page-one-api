class Medium < ActiveRecord::Base

	# ==== ASSOCIATIONS ====
	belongs_to :work

	# ==== ASSOCIATIONS ====
	validates_presence_of :content_type
	validates :caption, presence: true, length: {maximum:140}

	# ==== Class methods ====
	def self.new_medium_of_type(type)
		if type == "image"
      return ImageMedium.new(content_type:type)
    elsif type == "video"
      return VideoMedium.new(content_type:type)
    elsif type == "audio"
      return AudioMedium.new(content_type:type)
    else
      return nil
    end
  end

	# ==== INSTANCE METHODS ====
	def image_medium?
		false
	end

	def video_medium?
		false
	end

	def audio_medium?
		false
	end

end
