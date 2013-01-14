require 'sinatra/base'
module Sinatra::Sextant
  module TheRoute
    TEMPLATE = File.read(File.expand_path("../../templates/routes.html.erb", File.dirname(__FILE__)))
    class << self
      def registered(base)
        base.helpers do
          def build_routes(routes)
            labels = {
              :method_verb => "VERB",
              :path => "PATH",
              :desc => "DESCRIPTION",
            }
            width = %w(method_verb path desc).each_with_object({}) { |field, dest|
              dest[field.to_sym] = (routes.map{|r| r.send(field).length } + [labels[field.to_sym].length]).max
            }
            format = "%#{width[:method_verb]}s %-#{width[:path]}s %s"
            ([format % labels.values_at(:method_verb, :path, :desc)] +
             routes.map{|r| format % [r.method_verb, r.path, r.desc] }).
              join("\n")
          end
        end

        base.get '/sinatra/routes' do
          erb TEMPLATE, :locals => {:routes => build_routes(base.detailed_routes)}
        end
      end
    end
  end
end
