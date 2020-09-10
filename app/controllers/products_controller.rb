class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_category

  def index
    @products = Product.all.order(created_at: "DESC")
    @tags = Tag.all
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def get_category_children
    @category_children = Category.find(params[:parent_text]).children
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Item was successfully created.'
    else
      redirect_to new_item_path
    end
  end

  def show
    @products = Product.all.order(created_at: "DESC")
    @tags = Tag.all
    @images = Image.where(product_id: params[:id])
  end

  def edit
  end

  def update
  end
  
  def destroy
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def set_category  
    @category_parent_array = Category.where(ancestry: nil)
  end

  def product_params
    params.require(:product).permit(:name, :price, :text_1, :text_2, :shipping_fee, :category_id, :user_buyer_id, images_attributes: [:src, :_destroy, :id]).merge(user_seller_id: current_user.id)
  end
end
