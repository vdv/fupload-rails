module FileUploaderRails
  class Engine < Rails::Engine

    isolate_namespace 'fileuploader-rails'

    initializer "helper" do |app|
      ActiveSupport.on_load(:action_view) do
        include FileUploaderRails::Helpers
      end
    end

  end
end
