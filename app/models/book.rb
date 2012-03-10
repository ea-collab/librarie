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
    google_volumes = self.isbn.blank? ?
			get_google_volume_by_title(self.title) :
			get_google_volume_by_isbn(self.isbn)
		google_volumes.first
  end


  def self.get_google_volume_by_isbn(value)
	GoogleBooks.search('isbn:#{value}', {
					count: 1, api_key: GOOGLE_API_KEY})
	end
	
	def self.get_google_volume_by_title(value)
	GoogleBooks.search('intitle:#{value}', {
					count: 1, api_key: GOOGLE_API_KEY})
	end
  
end
