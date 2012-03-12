class ReservationsController < ApplicationController
  
  def new
    @book = Book.find(params[:book_id])
    @reservation = @book.reservations.new
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def create
    @book = Book.find(params[:book_id])
    @reservation = @book.reservations.new(params[:reservation])
    @reservation.dueDate = Time.now + 14.days
    if @reservation.save
      flash[:notice] = "Book reserved"
      #tell facebook you are reading a book
      if current_user.fbtoken
	      session['access_token'] = current_user.fbtoken
      	      @graph = Koala::Facebook::GraphAPI.new(session["access_token"])
      	      @graph.put_wall_post("I am reading a book called '#{@book.title}'")
      else
      #user is not obliged to tell on facebook, do nothing, maybe in Intermediate      
      end
            
      respond_to do |format|
        format.html { redirect_to book_path(@book) }
        format.js
      end
    else
      render :new
    end
  end
  
  def free
    @book = Book.find(params[:book_id])
    @reservation = @book.reservations.find(params[:id])
   
    if @reservation.free
      flash[:notice] = "Book is no longer reserved"
    else
      flash[:error]  = "Something went wrong"
    end
    redirect_to book_path(@book)
  end
  
end
