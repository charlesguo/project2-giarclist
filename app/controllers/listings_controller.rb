class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  # before_filter :authorize_listing, only: [:edit]

  # def authorize_listing
  #   @listing = Listing.where(user_id: current_user.id)
  #   print 'rtftgfge'
  #   print @listing.inspect
  #
  #   if @listing.blank?
  #     flash[:error] = "You cannot access someone else's record."
  #     redirect_to root_path
  #   else
  #     redirect_to :controller => 'listings', :action => 'edit', :id => params[:id]
  #   end
  # end

  # GET /listings
  # GET /listings.json
  def index
    @categories = Category.all
    if params[:search].present?
      @listings = Listing.search_title(params[:search]).order("created_at DESC")
    else
      @listings = Listing.all.order("created_at DESC")
    end
  end

  def search
  end

  def search_results
    @listings = Listing.search_title(params[:search]).order("created_at DESC")
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
    @categories = Category.all
  end

  # GET /listings/1/edit
  def edit
    @categories = Category.all

    @check = Listing.find(params[:id]).user_id
    if(@check != current_user.id)
      flash[:error] = "You cannot edit someone else's record."
      redirect_to listings_path
    end
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    @categories = Category.all

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:title, :description, :price, :category_id, :image)
    end
end
