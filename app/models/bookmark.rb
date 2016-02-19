class Bookmark < ActiveRecord::Base
	VALID_URL_REGEX = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?\Z/ix
	validates :url, presence: true, length: { maximum: 255 }, format: { with: VALID_URL_REGEX }
	validates :title, presence: true, length: { maximum: 255 }
	validates :tag, length: { maximum: 255 }
end
