class ColumnsController < ApplicationController
  before_action :set_category

  def index
    @columns = Column.all.order(created_at: "DESC")
    @tags = Tag.all
  end

  def new
    @column = Column.new
  end

  def get_category_children
    @category_children = Category.find(params[:parent_text]).children
  end

  def create
    @column = Column.new(column_params)
    if @column.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def column_params
    params.require(:column).permit(:tittle, :text, :image).merge(user_id: current_user.id)
  end

  def set_category  
    @category_parent_array = Category.where(ancestry: nil)
  end

end
