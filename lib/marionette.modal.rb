require "marionette.modal/version"

module MarionetteModal
  module Assets
    MARIONETTE_MODAL_COFFEE = File.open(File.join(File.expand_path('..', __FILE__), 'src', 'marionette.modal.coffee'), 'r').read
  end
end
