class BooksController < ApplicationController
  
  before_filter :find_book, only: [:show, :edit, :update, :destroy]

  def index
		@books_popular = Book.get_popular(18)
		@books_latest = Book.get_latest(18)
    respond_to do |format|
      format.html
      format.xml { render xml: Book.all.to_xml }
    end
  end
  
  def search
    @books = case params[:by]
      when 'isbn'    then Book.search_by_isbn(params[:query])
      when 'authors' then Book.search_by_authors(params[:query])
      else                Book.search_by_title(params[:query])
    end
  end
  
  def show
    @book_reservation = @book.reservation
		@google_volume = @book.google_volume
  end
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(params[:book])
    if @book.save
      flash[:notice] = "Book created"
      redirect_to books_path
    else
      render action: :new
    end
  end
  
  def edit
  end
  
  def update
    if @book.update_attributes(params[:book])
      flash[:notice] = "Book saved"
      redirect_to book_path(@book)
    else
      render action: :edit
    end
  end
  
  def destroy
    @book.destroy
    flash[:notice] = "Book deleted"
    redirect_to books_path
  end
  
  
  private
  
  def find_book
    @book = Book.find(params[:id])
  end

end
