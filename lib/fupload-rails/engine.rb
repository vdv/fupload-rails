module FuploadRails
  class Engine < ::Rails::Engine

    engine_name 'fupload'

    isolate_namespace FuploadRails

    initializer "helper" do |app|
      ActiveSupport.on_load(:action_view) do
        include FuploadRails::Helpers
      end
    end

  end
end
