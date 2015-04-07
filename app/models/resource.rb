class Resource < ActiveRecord::Base

	# ==== ASSOCIATIONS ====
	belongs_to :work

	# ==== VALIDATIONS ====
	validates :title, presence: true, length: {maximum: 50}
	validates :link, presence: true, length: {maximum: 250}
	validates :description, length: {maximum: 250}

end
