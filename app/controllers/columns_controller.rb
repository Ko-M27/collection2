class ColumnsController < ApplicationController
  before_action :set_category
  before_action :set_tag
  before_action :set_column, only: [:show]

  def index
    @columns = Column.all.order(created_at: "DESC")
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

  def show
    
  end

  private
  def column_params
    params.require(:column).permit(:tittle, :text, :image).merge(user_id: current_user.id)
  end

  def set_category  
    @category_parent_array = Category.where(ancestry: nil)
  end

  def set_tag
    @tags = Tag.all
  end

  def set_column
    @column = Column.find(params[:id])
  end

end
