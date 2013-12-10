require "marionette.modal/version"

module MarionetteModal
  module Assets
    module Javascripts
      module Marionette
        FILE = File.open( File.expand_path('../dist/marionette.modal.js', File.dirname(__FILE__) ), 'r').read
        REGION_FILE = File.open( File.expand_path('../dist/backbone.marionette.modals.js', File.dirname(__FILE__) ), 'r').read
      end
      module Backbone
        FILE = File.open( File.expand_path('../dist/backbone.modal.js', File.dirname(__FILE__) ), 'r').read
      end
      module Bundle
        FILE = File.open( File.expand_path('../dist/marionette.modal-bundled.js', File.dirname(__FILE__) ), 'r').read
      end
    end
    module Stylesheets
      CSS = File.open( File.expand_path('../dist/marionette.modal.css', File.dirname(__FILE__) ), 'r').read
      THEME_CSS = File.open( File.expand_path('../dist/marionette.modal.theme.css', File.dirname(__FILE__) ), 'r').read
    end
  end
end
