require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe "GET#create" do
    it "returns http success" do
      category = Category.create name:'laptop'
      post :create, params: { product: {category_id: category.id, name:'laptop', description:'moi',price:'3', quantity:'100' }}
      expect(Product.count).to eql(1)
    end

    it "returns http success" do
      category = Category.create name:'laptop'
      post :create, params: { product: {category_id: category.id, name:'laptop', description:'moi',price:'3', quantity:'100' }}
      expect(response).to redirect_to(root_path)
    end
  end

  describe "GET #index" do
    it "populates an array of products" do
      category = Category.create name:'laptop'
      get :index, params: { product: {category_id: category.id, name:'laptop', description:'moi',price:'3', quantity:'100' }}
      expect(assigns(:products))
    end

   it "renders the :index view" do
    get :index
    expect(response).to render_template(:index)
  end
 end
end
