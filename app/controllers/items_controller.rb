class ItemsController < ApplicationController

	def index
		@items = Item.all
	end

	def new
		@item = Item.new
	end

	def edit
		  @item = Item.find(params[:id])
	end

	   def show
      @item = Item.find(params[:id])
   end

	def create
		@item = Item.new(item_params)
		if @item.save
			redirect_to action: 'index'
		else 
			render action: 'new'
		end
	end

	 def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

	private

	def item_params
		params.require(:item).permit(:name, :category, :price)
	end

end
