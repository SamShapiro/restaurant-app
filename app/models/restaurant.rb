class Restaurant < ActiveRecord::Base
    validates :name, :address, :description, :state, :zipcode, 
            :city, :phone, presence: { :message => "cannot be blank" }
    validates :zipcode, length: { minimum: 5, maximum: 5}, numericality: true
    validates :phone, length: { minimum: 10, maximum: 12}, numericality: true,
            format: { with: /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/ }
    validates :name, uniqueness: { case_sensitive: false }
    validates :description, length: { maximum: 300}
    validates :state, length: { maximum: 2}
    
    belongs_to :user
    has_many :reservations
    has_and_belongs_to_many :categories, join_table: "restaurants_categories"
end
