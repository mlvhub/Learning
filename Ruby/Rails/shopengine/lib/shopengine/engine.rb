module Shopengine
  class Engine < ::Rails::Engine
    isolate_namespace Shopengine
  end

  require 'carrierwave'
end
