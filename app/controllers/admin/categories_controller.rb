class Admin::CategoriesController < AdminController
  before_action :find_category, only: [:edit, :update, :destroy]
  def new
    @category = Category.new
  end

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = 'Create category successfully'
      redirect_to admin_categories_path
    else
        flash[:alert] = 'Create category failed'
        render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(category_params)
      flash[:success] = "You updated successfully"
      redirect_to admin_categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = "You are delete"
    redirect_to admin_categories_path
  end

  private

    def find_category
      @category = Category.find(params[:id])
    end

  private

  def category_params
    params.require(:category).permit :name, :parent_id
  end
  end
