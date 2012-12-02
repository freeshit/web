class FbItemsController < ApplicationController
  # GET /fb_items
  # GET /fb_items.json
  def index
    #@fb_items = FbItem.all
    response = Net::HTTP.get_response( URI.parse( "http://freeshit.firebaseio.com/items.json" ) );
    begin
       @fb_item = JSON.parse(response.body)
    rescue
       render_404
       return
    end
    
    @fb_items = JSON.parse(response.body)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fb_items }
    end
    
  end

  # GET /fb_items/1
  # GET /fb_items/1.json
  def show
    require 'net/http'
    require 'json'

    response = Net::HTTP.get_response( URI.parse( "http://freeshit.firebaseio.com/items/%s.json" % [ params[:id] ] ) );

    begin
       @fb_item = JSON.parse(response.body)
    rescue
       render_404
       return
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fb_item }
    end
  end

  # GET /fb_items/new
  # GET /fb_items/new.json
  def new
    @fb_item = FbItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fb_item }
    end
  end

  # GET /fb_items/1/edit
  def edit
    @fb_item = FbItem.find(params[:id])
  end

  # POST /fb_items
  # POST /fb_items.json
  def create
    @fb_item = FbItem.new(params[:fb_item])

    respond_to do |format|
      if @fb_item.save
        format.html { redirect_to @fb_item, notice: 'Fb item was successfully created.' }
        format.json { render json: @fb_item, status: :created, location: @fb_item }
      else
        format.html { render action: "new" }
        format.json { render json: @fb_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fb_items/1
  # PUT /fb_items/1.json
  def update
    @fb_item = FbItem.find(params[:id])

    respond_to do |format|
      if @fb_item.update_attributes(params[:fb_item])
        format.html { redirect_to @fb_item, notice: 'Fb item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fb_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fb_items/1
  # DELETE /fb_items/1.json
  def destroy
    @fb_item = FbItem.find(params[:id])
    @fb_item.destroy

    respond_to do |format|
      format.html { redirect_to fb_items_url }
      format.json { head :no_content }
    end
  end
end
