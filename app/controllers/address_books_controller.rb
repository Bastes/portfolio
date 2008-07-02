class AddressBooksController < ApplicationController
  before_filter :authorize, :except => :index
  
  # GET /address_books
  # GET /address_books.xml
  def index
    @address_books = AddressBook.find(:all, :include => :addresses, :order => 'address_books.rank ASC, addresses.rank ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @address_books }
    end
  end

  # GET /address_books/new
  # GET /address_books/new.xml
  def new
    @address_book = AddressBook.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @address_book }
    end
  end

  # GET /address_books/1/edit
  def edit
    @address_book = AddressBook.find(params[:id])
  end

  # POST /address_books
  # POST /address_books.xml
  def create
    @address_book = AddressBook.new(params[:address_book])

    respond_to do |format|
      if @address_book.save
        flash[:notice] = 'AddressBook was successfully created.'
        format.html { redirect_to(address_books_url) }
        format.xml  { render :xml => @address_book, :status => :created, :location => @address_book }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @address_book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /address_books/1
  # PUT /address_books/1.xml
  def update
    @address_book = AddressBook.find(params[:id])

    respond_to do |format|
      if @address_book.update_attributes(params[:address_book])
        flash[:notice] = 'AddressBook was successfully updated.'
        format.html { redirect_to(address_books_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @address_book.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
  # DELETE /address_books/1
  # DELETE /address_books/1.xml
  def destroy
    @address_book = AddressBook.find(params[:id])
    @address_book.destroy

    respond_to do |format|
      format.html { redirect_to(address_books_url) }
      format.xml  { head :ok }
    end
  end
  
  # /address_books/update_ranks
  # /address_books/update_ranks.xml
  def update_ranks
    params[:address_books].each_index do |i|
      address_book = AddressBook.find params[:address_books][i]
      address_book.rank = i
      address_book.save
    end
    
    flash[:notice] = 'Address books successfully reordered.'
    respond_to do |format|
      format.html { redirect_to(address_books_url) }
      format.xml  { head :ok }
    end
  end
end
