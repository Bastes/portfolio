class PagesController < ApplicationController
  before_filter :authorize, :except => [:index, :show]
  
  # GET /pages
  # GET /pages.xml
  def index
    # shows only the last pages created
    @pages = Page.newer

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages }
    end
  end

  # GET /sections/1/pages/1
  # GET /sections/1/pages/1.xml
  def show
    @page = Page.find(params[:id])
    @section = @page.section

    respond_to do |format|
      format.html { render :template => 'sections/show' }
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    @page = Page.new
    @page.section_id = params[:section_id]
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.xml
  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        flash[:notice] = :page_created.l
        format.html { redirect_to(@page.section) }
        format.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        flash[:notice] = :page_updated.l
        format.html { redirect_to(@page) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = :page_destroyed.l

    respond_to do |format|
      format.html { redirect_to(pages_url) }
      format.xml  { head :ok }
    end
  end
  
  # /sections/1/pages/update_ranks
  # /sections/1/pages/update_ranks.xml
  def update_ranks
    @section = Section.find params[:section_id]
    params[:pages].each_index do |i|
      page = @section.pages.find params[:pages][i]
      page.rank = i
      page.save
    end
    
    flash[:notice] = :pages_reordered.l
    respond_to do |format|
      format.html { redirect_to(@section) }
      format.xml  { head :ok }
    end
  end
end
