class Article < ActiveRecord::Base
	
	has_many :comments, dependent: :destroy

	belongs_to :user

	has_one_attached :image

	has_one_attached :video

	has_one_attached :file

	has_one_attached :thumbnail

	validates :title, presence: true, length: { minimum: 3, maximum: 50 }

	validates :description, presence: true, length: { minimum: 10, maximum: 3000 }

	validates :user_id, presence: true

end