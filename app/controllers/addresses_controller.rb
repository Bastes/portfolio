class AddressesController < ApplicationController
  before_filter :authorize
  
  # GET /address_book/1/addresses/new
  # GET /address_book/1/addresses/new.xml
  def new
    @address = Address.new(:address_book_id => params[:address_book_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @address }
    end
  end

  # GET /addresses/1/edit
  def edit
    @address = Address.find(params[:id])
  end

  # POST /addresses
  # POST /addresses.xml
  def create
    @address = Address.new(params[:address])

    respond_to do |format|
      if @address.save
        flash[:notice] = :address_created.l
        format.html { redirect_to(address_books_path) }
        format.xml  { render :xml => @address, :status => :created, :location => @address }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /addresses/1
  # PUT /addresses/1.xml
  def update
    @address = Address.find(params[:id])

    respond_to do |format|
      if @address.update_attributes(params[:address])
        flash[:notice] = :address_created.l
        format.html { redirect_to(address_books_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.xml
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    flash[:notice] = :address_deleted.l
    
    respond_to do |format|
      format.html { redirect_to(addresses_url) }
      format.xml  { head :ok }
    end
  end
  
  # /address_books/1/addresses/update_ranks
  # /address_books/1/addresses/update_ranks.xml
  def update_ranks
    @address_book = AddressBook.find params[:address_book_id]
    addresses = params["address_book_addresses_#{@address_book.id}"]
    addresses.each_index do |i|
      address = @address_book.addresses.find addresses[i]
      address.rank = i
      address.save
    end
    
    flash[:notice] = :addresses_reordered.l
    respond_to do |format|
      format.html { redirect_to(address_books_url) }
      format.xml  { head :ok }
    end
  end
end
