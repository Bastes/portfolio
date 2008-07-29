class ThumbnailsController < ApplicationController
  # GET /pictures/1/thumbnails/new
  def new
    @picture = Picture.find params[:picture_id]
    
    respond_to do |format|
      format.html # new.html.erb
    end
  end
  
  # POST /pictures/1/thumbnails
  def create
    @picture = Picture.find params[:picture_id]
    
    respond_to do |format|
      if @picture.recrop_thumb(params[:left], params[:top], params[:version].to_sym)
        flash[:notice] = :thumbnail_created.l
        format.html { redirect_to(@picture) }
      else
        format.html { render :action => "new" }
      end
    end
  end

end
