require "marionette.modal/version"

module MarionetteModal
  module Assets
    def self.MarionetteModal
      File.open('../src/marionette.modal.coffee', 'r').read
    end
  end
end
