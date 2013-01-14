require 'spec_helper'
require 'pry'

describe Sinatra::Sextant do
  it { should be }

  describe 'routing DSL' do
    before do
      mock_app do
        register Sinatra::Sextant
        desc "Showing foo info for :id"
        params :id, "ID for foo"
        get '/users/:id' do
          "Hello"
        end
      end
    end

    #it { binding.pry }
    specify { raw_app.ancestors.should include Sinatra::Base }
    describe "routes defined by 2, 1 default with an application specific route" do
      specify { raw_app.routes["GET"].should have(1 + 1).item }
      specify { raw_app.routes["HEAD"].should have(1 + 1).item }
    end
    specify { raw_app.detailed_routes.should have(1).item }
    it "should not break defining routes" do
      get '/users/1'
      last_response.should be_ok
      last_response.body.should == "Hello"
    end

    describe '#detailed_routes.first' do
      subject { raw_app.detailed_routes.first }
      its(:desc) { should == "Showing foo info for :id"}
      its(:params) { should have(1).item }
      its("params.first") { should == [:id, "ID for foo"] }
      its(:path) { should == '/users/:id' }
      its(:method_verb) { should == "GET" }
    end
  end
end
