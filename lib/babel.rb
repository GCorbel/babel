require "babel/engine"
require "babel/translation_helper"
require "babel/translation"
require "babel/translation_saver"

module Babel
  class Engine < Rails::Engine
    isolate_namespace Babel
  end
end
