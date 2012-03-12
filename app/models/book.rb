# == Schema Information
#
# Table name: books
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  authors     :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  isbn        :string(255)
#

class Book < ActiveRecord::Base
  
	GOOGLE_API_KEY = 'AIzaSyA37vpAdj7HrMcpuxKtCB3DdMtzmjse5dI'

  validates :title, presence: true, uniqueness: true
  validates :authors, presence: true
  
  validates_with IsbnValidator
  
  has_many :reservations
  
  def reservation
    self.reservations.where(state: 'reserved').first
  end
  
  def self.search_by_isbn(value)
    self.where(isbn: value)
  end

  def self.search_by_authors(value)
    self.where("authors LIKE ?", "%#{value}%").order(
               "authors asc, created_at desc")
  end

  def self.search_by_title(value)
    self.where("title LIKE ?", "%#{value}%").order(
         "title asc, created_at desc")
  end

	def google_volume
		if self.isbn.blank?
			nil
		else		
		volumes = GoogleBooks.search("isbn:#{self.isbn}", {	
		  count: 1, api_key: GOOGLE_API_KEY })
		volume = volumes.count > 0 ? volumes.first : nil
		end
	end	
    
  
end
