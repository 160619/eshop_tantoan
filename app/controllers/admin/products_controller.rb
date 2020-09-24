class Admin::ProductsController < AdminController

  def new
    @products = Product.new
  end

  def index
    @products = Product.all.order(:name)
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = 'Create product successfully'
      redirect_to admin_product_path
    else
      flash[:alert] = 'Create product failed'
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit :category_id, :name, :description, :price, :quantity, :rating, :aggregate_rating, :avatar
  end
end
