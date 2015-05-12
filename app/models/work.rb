class Work < ActiveRecord::Base
	acts_as_taggable_on :creators, :modes, :references
	
	# ==== ASSOCIATIONS ====
	has_many :media, dependent: :destroy
	has_many :resources, dependent: :destroy
	belongs_to :collection

	# ==== VALIDATIONS ====
	# validates :title, presence: true, length: {maximum: 50}
	# validates :date, presence: true, length: {maximum: 5}
  # validates :circa, presence: true
	# validates :place, presence: true, length: {maximum: 50}

end
