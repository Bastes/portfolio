class DocumentsController < ApplicationController
  before_filter :authorize
  
  # GET /documents
  def index
    @documents = Document.find(:all)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /documents/1
  def show
    @document = Document.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /documents/new
  def new
    @document = Document.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /documents/1/edit
  def edit
    @document = Document.find(params[:id])
  end

  # POST /documents
  def create
    @document = Document.new(params[:document])

    respond_to do |format|
      if @document.save
        flash[:notice] = :document_created.l
        if params[:page_id]
          embedded = EmbeddedDocument.new(:page_id => params[:page_id], :document_id => @document.id)
          if embedded.save
            flash[:notice] += :embedded_document_created.l
            format.html { redirect_to edit_page_path(params[:page_id]) }
          else
            redirect_to (page_path(params[:page_id]))
          end
        else
          format.html { redirect_to( documents_url ) }
        end
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /documents/1
  def update
    @document = Document.find(params[:id])

    respond_to do |format|
      if @document.update_attributes(params[:document])
        flash[:notice] = :document_updated.l
        format.html { redirect_to( documents_url ) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /documents/1
  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    flash[:notice] = :document_deleted.l

    respond_to do |format|
      format.html { redirect_to(documents_url) }
    end
  end
end
