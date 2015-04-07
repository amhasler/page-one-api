class Collection < ActiveRecord::Base
	
	# ==== ASSOCIATIONS ====
	belongs_to :user
	has_many :works, dependent: :destroy

	# ==== VALIDATIONS ====
	validates :title, presence: true, length: {maximum: 50}

end
