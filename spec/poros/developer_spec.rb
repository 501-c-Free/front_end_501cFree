require 'rails_helper'

RSpec.describe Developer do
  it "can create a developer object" do
    data ={
      id: '6',
        attributes:{
          name: 'Becky',
          email: 'bn@gmail.com',
          github: 'bn',
          linkedin: 'b_n'
        }
      }
      dev = Developer.new(data)

      expect(dev).to be_an_instance_of(Developer)
      expect(dev.id).to eq("6")
      expect(dev.name).to eq("Becky")
      expect(dev.email).to eq('bn@gmail.com')
      expect(dev.github).to eq('bn')
      expect(dev.linkedin).to eq('b_n')
  end
end
