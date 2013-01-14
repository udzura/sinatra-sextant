require 'spec_helper'

describe Sinatra::Sextant do
  describe 'should add a route for checking defined routes' do
    before do
      mock_app do
        register Sinatra::Sextant
        desc "Showing foo info for :id"
        params :id, "ID for foo"
        get '/users/:id' do
          "Hello"
        end
      end
      get '/sinatra/routes'
    end

    it 'should define `GET /sinatra/routes`' do
      last_response.should be_ok
    end

    it 'should render a built-in template' do
      last_response.body.should =~ /<!DOCTYPE html>/
    end

    it 'should render routes defined' do
      last_response.body.should include "GET", "/users/:id", "Showing foo info for :id"
    end
  end
end

