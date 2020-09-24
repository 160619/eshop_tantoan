require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  describe "#create" do
    context 'create a review successfully' do
      let(:user) do
        User.create(email: 'demo@gmail.com', password:'123456', password_confirmation: '123456')
      end
      let(:category) do
        Category.create(name: 'Apple')
      end
      let(:product) do
        Product.create(name: 'P1', price: 1000, quantity: 100, category_id: category.id)
      end
      let(:review) do
        Review.create(product_id: product.id, content: 'a'*20, rating: 5)
      end

      before do
        sign_in user
      end

      it "creates a new comment in database" do
        post :create, params:{review_id: review.id, comment: {body: 'a'*20}}
        expect(Comment.count).to eql(1)
      end
    end
   end
  end
