module Openproject
  module Installer
    class Configure < Thor::Group
      include Thor::Actions

      argument :path, type: :string
      class_option :database, type: :string,
                    default: 'mysql'
      class_option :auto, type: :boolean

      def self.source_root
        [File.expand_path('../templates', __FILE__)]
      end

      def create_database_yaml
        template 'database.yml', "#{path}/config/database.yml", force: options[:auto]
      end

      def database_name
        'openproject'
      end

      def database_host
        'localhost'
      end

      def database_username
        'root'
      end

      def database_password
        ''
      end
    end
  end
end
