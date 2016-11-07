require 'rails_helper'
require 'spec_helper'

describe Ticket do
    describe 'All types' do
        it 'should return all types' do
            expect(Ticket.all_types).to be_truthy    
        end
    end
end