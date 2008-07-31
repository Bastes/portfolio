class PicturesController < ApplicationController
  before_filter :authorize
  
  # GET /pictures
  def index
    @pictures = Picture.find(:all)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /pictures/1
  def show
    @picture = Picture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /pictures/new
  def new
    @picture = Picture.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /pictures/1/edit
  def edit
    @picture = Picture.find(params[:id])
  end

  # POST /pictures
  def create
    @picture = Picture.new(params[:picture])

    respond_to do |format|
      if @picture.save
        flash[:notice] = :picture_created.l
        if params[:page_id]
          embedded = EmbeddedPicture.new(:page_id => params[:page_id], :picture_id => @picture.id)
          if embedded.save
            flash[:notice] += :embedded_picture_created.l
            format.html { redirect_to edit_page_path(params[:page_id]) }
          else
            redirect_to (page_path(params[:page_id]))
          end
        else
          format.html { redirect_to( pictures_url ) }
        end
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /pictures/1
  def update
    @picture = Picture.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(params[:picture])
        flash[:notice] = :picture_updated.l
        format.html { redirect_to(pictures_url) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /pictures/1
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = :picture_deleted.l

    respond_to do |format|
      format.html { redirect_to(pictures_url) }
    end
  end
end
