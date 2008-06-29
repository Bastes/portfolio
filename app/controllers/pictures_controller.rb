class PicturesController < ApplicationController
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
        flash[:notice] = 'Picture was successfully created.'
        format.html { redirect_to(pictures_url) }
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
        flash[:notice] = 'Picture was successfully updated.'
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

    respond_to do |format|
      format.html { redirect_to(pictures_url) }
    end
  end
end
