require 'sinatra/base'
module Sinatra::Sextant
  ##
  # Value object for route description
  class RouteDescription
    def initialize(options={})
      @params ||= []
    end
    attr_accessor :desc, :params, :path, :method_verb
  end
end
