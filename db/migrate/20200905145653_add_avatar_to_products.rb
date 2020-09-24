class AddAvatarToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :avatar, :string
  end
end
