class CategoriesController < ApplicationController
  before_action :set_category

  def show
    @columns = Column.where(category_id: params[:id])
    @tags = Tag.all
  end

  private
  def set_category
    @category_parent_array = Category.where(ancestry: nil)
  end
end
