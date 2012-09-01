require 'rails/generators'
require 'rails/generators/migration'

module Fupload
  class InstallGenerator < ::Rails::Generators::Base
    include ::Rails::Generators::Migration

    def self.source_root
      @source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
    end

    def self.next_migration_number(dirname)
      Time.now.strftime("%Y%m%d%H%M%S")
    end

    def mount_engine
      route "mount FuploadRails::Engine => '/fu_rails'"
    end

    def create_models
      [ :asset ].each do |filename|
        template "models/#{filename}.rb", File.join('app/models', engine_dir, "#{filename}.rb")
      end

      template "uploaders/fupload_rails_asset_uploader.rb", File.join("app/uploaders", "fupload_rails_asset_uploader.rb")
    end

    def rake_db
      rake('fupload_rails:install:migrations')
    end

    # def migration
    #   Dir['migrations/*.rb'].each do |f|
    #     migration_template f, File.join('db/migrate', File.basename(f))
    #   end
    # end

    protected

    def engine_dir
      'fupload_rails'
    end

  end
end
