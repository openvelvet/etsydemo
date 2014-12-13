class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
    @listing = Listing.find(params[:listing_id])
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @order.save
    @listing = Listing.find(params[:listing_id])
    @order.buyer_id = current_user.id

    @order.listing_id = @listing.id
    @seller = @listing.user
    @order.seller_id = @seller.id

    respond_to do |f|
      if @order.save
        f.html { redirect_to root_url, notice: "Order was successfully created boy!"}
      else
        f.html { render action: "new"}
      end
    end
  end

  def update
    @order.update(order_params)
  end

  def destroy
    @order.destroy
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:city, :address, :state, :zip_code)
    end
end
