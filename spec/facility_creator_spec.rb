require 'spec_helper'


RSpec.describe Facility_creator do 
    describe '#initialize' do 
        it 'initializes' do 
           facility_creator =  Facility_creator.new 
           
           expect(facility_creator).to be_an_instance_of(Facility_creator)
        end 
    end 
    #checking if its a new instance of facility creator class

    describe '#create_co_facilities' do 
    it 'is a CO instance of Facility' do 
        facility_creator =  Facility_creator.new 
        colorado_facilities = DmvDataService.new.co_dmv_office_locations

        expect(facility_creator.create_co_facilities(colorado_facilities).first).to be_an_instance_of(Facility)
        end
    end  
    #checking that create CO facilities works when given CO data.
    it 'can access the data' do 
        facility_creator =  Facility_creator.new 
        colorado_facilities = DmvDataService.new.co_dmv_office_locations

        expect(facility_creator.create_co_facilities(colorado_facilities).first.name).not_to be(nil)
        expect(facility_creator.create_co_facilities(colorado_facilities).first.address).not_to be(nil)
        expect(facility_creator.create_co_facilities(colorado_facilities).first.registered_vehicles).to eq([])
        expect(facility_creator.create_co_facilities(colorado_facilities).first.collected_fees).to eq(0)
        expect(facility_creator.create_co_facilities(colorado_facilities).first.services).not_to be(nil)
        expect(facility_creator.create_co_facilities(colorado_facilities).first.phone).not_to be(nil)
    end 
end 
#checking that create_co_facilities facilities have a value(or just not nil)
