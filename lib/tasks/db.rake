namespace :db do
  desc "TODO"
  task fake_data: :environment do
    User.create(email:'demoadmin@gmail.com', password:'111111', password_confirmation: '111111', role:'admin')

    arr_category_names = %w[samsung macbook sony lg iphone asus ipa hp lenovo ]

    arr_category_names.each do |category_name|
    puts "Creating category #{category_name}"
    category = Category.create(name: category_name)

      ['p1','p2'].each do |product_name|
      puts "Creating product #{product_name}"
      Product.create(name: product_name, price: 1000, category_id: category.id)
    end
   end
 end
end
