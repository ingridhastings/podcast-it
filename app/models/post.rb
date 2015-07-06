class Post < ActiveRecord::Base
	belongs_to :user
	acts_as_votable
	validates :title, length: { maximum: 50 }, presence: true, uniqueness: {scope: :user}
  	validates :link, presence: true,  uniqueness: {scope: :user}



end
