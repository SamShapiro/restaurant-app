class Category < ActiveRecord::Base
    validates :name, presence: {:message => "cannot be blank" }
    
    has_and_belongs_to_many :restaurants, join_table: "restaurants_categories"
end
