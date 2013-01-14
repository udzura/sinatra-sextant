require 'sinatra/base'
require 'sinatra/sextant/version'
require 'sinatra/sextant/route_description'
require 'sinatra/sextant/the_route'

module Sinatra
  module Sextant
    class InvalidDescriptionDSLError < StandardError
    end

    def desc(text)
      @current_routing_definition = RouteDescription.new
      @current_routing_definition.desc = text
    end

    def params(name, text=nil)
      raise InvalidDescriptionDSLError, "params must be put after desc section" unless @current_routing_definition
      @current_routing_definition.params << [name.to_sym, text]
    end

    def route(verb, path, *args, &blk)
      if @current_routing_definition
        @current_routing_definition.method_verb = verb
        @current_routing_definition.path = path
        self.detailed_routes << @current_routing_definition
        @current_routing_definition = nil
      end
      super(verb, path, *args, &blk)
    end

    def detailed_routes
      @detailed_routes ||= []
    end

    def self.registered(base)
      base.register TheRoute
    end
  end

  module Delegator # add methods to delegate
    delegate :desc, :params
  end

  register Sextant
end
