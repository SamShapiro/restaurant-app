class CreateRestaurantsCategories < ActiveRecord::Migration
  def change
    create_table :restaurants_categories, id: false do |t|
      t.belongs_to :restaurant, index: true
      t.belongs_to :category, index: true
    end
  end
end
