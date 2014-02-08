class OrdersController < ApplicationController

	def index
		@orders = Order.all
		@items = Item.all
	end

	def new
		@order = Order.new
		@items = Item.all


	end

	def create
		@items = Item.all
		@order = Order.new(order_params)
		if @order.save
			redirect_to action: 'index'
		else
			render action: 'new'
		end
	end


	private

	def order_params
		params.require(:order).permit(:name, :item_cat => [], :item_ids => [])
	end	
end
