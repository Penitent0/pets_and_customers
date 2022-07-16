class Veterinarian
  attr_reader :name,
              :customers
  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def pets_in_care
    # pet_array = []
    # @customers.each do |customer|
    #   customer.pets.each do |pet|
    #     pet_array << pet
    #   end
    # end
    # pet_array
    pet_ages = @customers.map { |customer| customer.pets }.sort_by {|pet| pet.age }

  end
end