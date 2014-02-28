module Shopengine
  class Engine < ::Rails::Engine
    isolate_namespace Shopengine

    require 'carrierwave'
  end
end
