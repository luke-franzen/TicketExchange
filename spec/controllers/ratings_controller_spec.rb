require 'rails_helper'
require 'spec_helper'

describe RatingsController do
    describe 'Rating' do
        it 'should create a rating when it does not exist' do
            @current_user.stub(:id).and_return(1)
            expect(Rating).to receive(:find_by).and_return(nil)
            expect(Rating).to receive(:create)
            response.body.should be_blank
            put :update_rating, :value => 1, :rated_user => 2
        end
        it 'should update a rating when it already exists' do
            @current_user.stub(:id).and_return(1)
            data = Rating.new
            expect(Rating).to receive(:find_by).and_return(data)
            expect(data).to receive(:save)
            response.body.should be_blank
            put :update_rating, :value => 1, :rated_user => 2
        end
    end
end