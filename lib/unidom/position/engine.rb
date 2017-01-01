module Unidom
  module Position

    class Engine < ::Rails::Engine

      include Unidom::Common::EngineExtension

      isolate_namespace ::Unidom::Position

      enable_initializer enum_enabled: false, migration_enabled: true

    end

  end
end
