class EmbeddedPicturesController < ApplicationController
  before_filter :authorize
  
  # GET /embedded_pictures
  # GET /embedded_pictures.xml
  def index
    @embedded_pictures = EmbeddedPicture.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @embedded_pictures }
    end
  end

  # GET /embedded_pictures/new
  # GET /embedded_pictures/new.xml
  def new
    @page = Page.find params[:page_id], :include => :embedded_pictures
    already_embedded = @page.embedded_pictures.collect do |e| e.picture_id end
    conditions = already_embedded.empty? ? [] : ['pictures.id NOT IN (?)', already_embedded] unless already_embedded.empty?
    @pictures = Picture.find :all,
                               :include => :embedded_pictures,
                               :conditions => conditions,
                               :group => 'pictures.id',
                               :order => 'COUNT(embedded_pictures.id) ASC'
  end

  # POST /embedded_pictures
  # POST /embedded_pictures.xml
  def create
    @embedded_picture = EmbeddedPicture.new(params[:embedded_picture])
    @page = @embedded_picture.page
    
    respond_to do |format|
      if @embedded_picture.save
        format.js
        format.html { render :action => :index }
        format.xml  { render :xml => @embedded_picture, :status => :created, :location => @embedded_picture }
      else
        format.js
        format.html { render :action => "new" }
        format.xml  { render :xml => @embedded_picture.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /embedded_pictures/1
  # DELETE /embedded_pictures/1.xml
  def destroy
    @embedded_picture = EmbeddedPicture.find(params[:id])
    @embedded_picture.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to(embedded_pictures_url) }
      format.xml  { head :ok }
    end
  end
  
  # /pages/1/embedded_pictures/update_ranks
  # /pages/1/embedded_pictures/update_ranks.xml
  def update_ranks
    @page = Page.find params[:page_id]
    @page.update_embedded_pictures_ranks params[:embedded_pictures]
    
    flash[:notice] = 'Pictures successfully reordered.'
    respond_to do |format|
      format.html { redirect_to(@page) }
      format.xml  { head :ok }
    end
  end
  
end

