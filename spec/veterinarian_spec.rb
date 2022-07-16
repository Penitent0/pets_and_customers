require './lib/pet'
require './lib/customer'
require './lib/veterinarian'

RSpec.describe Veterinarian do
  before do
    @joel = Customer.new("Joel", 2)
    @phil = Customer.new("Phil", 3)
    @vet = Veterinarian.new("Spot Veterinarian Clinic")
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
    @spot = Pet.new({name: "Spot", type: :cat, age: 9})
    @clifford = Pet.new({name: "Clifford", type: :dog, age: 5})
  end
  it 'exists' do
    expect(@vet).to be_a(Veterinarian)
  end

  it 'has a name' do
    expect(@vet.name).to eq("Spot Veterinarian Clinic")
  end

  it 'has customers' do
    expect(@vet.customers).to eq([])
    @vet.add_customer(@joel)
    expect(@vet.customers).to eq([@joel])
    @vet.add_customer(@phil)
    expect(@vet.customers).to eq([@joel, @phil])
  end

  it 'customers have pets' do
    @joel.adopt(@samson)
    @phil.adopt(@spot)
    @phil.adopt(@clifford)
    @vet.add_customer(@phil)
    @vet.add_customer(@joel)
    expect(@vet.customers).to eq([@joel, @phil])
    expect(@vet.customers[0].pets).to eq([@samson])
    expect(@vet.customers[1].pets).to eq([@spot, @clifford])
  end

  it 'can sort pets by age' do
    @joel.adopt(@samson)
    @phil.adopt(@spot)
    @phil.adopt(@clifford)
    @vet.add_customer(@phil)
    @vet.add_customer(@joel)
    expect(@vet.pets_in_care).to eq([@spot, @clifford, @samson])

  end
end

