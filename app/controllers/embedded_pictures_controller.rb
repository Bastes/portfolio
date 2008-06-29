class EmbeddedPicturesController < ApplicationController
  # GET /embedded_pictures
  # GET /embedded_pictures.xml
  def index
    @embedded_pictures = EmbeddedPictures.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @embedded_pictures }
    end
  end

  # GET /embedded_pictures/1
  # GET /embedded_pictures/1.xml
  def show
    @embedded_pictures = EmbeddedPictures.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @embedded_pictures }
    end
  end

  # GET /embedded_pictures/new
  # GET /embedded_pictures/new.xml
  def new
    @embedded_pictures = EmbeddedPictures.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @embedded_pictures }
    end
  end

  # GET /embedded_pictures/1/edit
  def edit
    @embedded_pictures = EmbeddedPictures.find(params[:id])
  end

  # POST /embedded_pictures
  # POST /embedded_pictures.xml
  def create
    @embedded_pictures = EmbeddedPictures.new(params[:embedded_pictures])

    respond_to do |format|
      if @embedded_pictures.save
        flash[:notice] = 'EmbeddedPictures was successfully created.'
        format.html { redirect_to(@embedded_pictures) }
        format.xml  { render :xml => @embedded_pictures, :status => :created, :location => @embedded_pictures }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @embedded_pictures.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /embedded_pictures/1
  # PUT /embedded_pictures/1.xml
  def update
    @embedded_pictures = EmbeddedPictures.find(params[:id])

    respond_to do |format|
      if @embedded_pictures.update_attributes(params[:embedded_pictures])
        flash[:notice] = 'EmbeddedPictures was successfully updated.'
        format.html { redirect_to(@embedded_pictures) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @embedded_pictures.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /embedded_pictures/1
  # DELETE /embedded_pictures/1.xml
  def destroy
    @embedded_pictures = EmbeddedPictures.find(params[:id])
    @embedded_pictures.destroy

    respond_to do |format|
      format.html { redirect_to(embedded_pictures_url) }
      format.xml  { head :ok }
    end
  end
end
