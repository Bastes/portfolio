class EmbeddedDocumentsController < ApplicationController
  before_filter :authorize
  
  # GET /embedded_documents
  # GET /embedded_documents.xml
  def index
    @embedded_documents = EmbeddedDocument.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @embedded_documents }
    end
  end

  # GET /embedded_documents/new
  # GET /embedded_documents/new.xml
  def new
    @page = Page.find params[:page_id], :include => :embedded_documents
    already_embedded = @page.embedded_documents.collect do |e| e.document_id end
    conditions = already_embedded.empty? ? [] : ['documents.id NOT IN (?)', already_embedded] unless already_embedded.empty?
    @documents = Document.find :all,
                               :include => :embedded_documents,
                               :conditions => conditions,
                               :group => 'documents.id',
                               :order => 'COUNT(embedded_documents.id) ASC'
  end

  # POST /embedded_documents
  # POST /embedded_documents.xml
  def create
    @embedded_document = EmbeddedDocument.new(params[:embedded_document])
    @page = @embedded_document.page
    
    respond_to do |format|
      if @embedded_document.save
        flash[:notice] = :embedded_document_created.l
        format.js
        format.html { render :action => :index }
        format.xml  { render :xml => @embedded_document, :status => :created, :location => @embedded_document }
      else
        format.js
        format.html { render :action => "new" }
        format.xml  { render :xml => @embedded_document.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /embedded_documents/1
  # DELETE /embedded_documents/1.xml
  def destroy
    @embedded_document = EmbeddedDocument.find(params[:id])
    @embedded_document.destroy
    flash[:notice] = :embedded_document_deleted.l

    respond_to do |format|
      format.js
      format.html { redirect_to(embedded_documents_url) }
      format.xml  { head :ok }
    end
  end
  
  # /pages/1/embedded_documents/update_ranks
  # /pages/1/embedded_documents/update_ranks.xml
  def update_ranks
    @page = Page.find params[:page_id]
    @page.update_embedded_documents_ranks params[:embedded_documents]
    
    flash[:notice] = :embedded_documents_reordered.l
    respond_to do |format|
      format.html { redirect_to(@page) }
      format.xml  { head :ok }
    end
  end
  
end

