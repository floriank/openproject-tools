module Openproject
  module Installer
    REPO_URL = 'https://github.com/opf/openproject'
    BRANCH = 'dev'
    class Clone < Thor::Group
      include Thor::Actions

      desc 'This will clone a version of OpenProject into a path'
      argument :path, type: :string, required: true,
               desc: 'The path to clone into'

      class_option :auto, type: :boolean,
                   desc: 'Ask no questions during installation'
      class_option :branch, type: :string,
                   default: BRANCH,
                   desc: 'The version of OpenProject to use'
      class_option :repository, type: :string,
                   default: REPO_URL,
                   desc: 'Specify different repoistory URL'
      class_option :developer, type: :boolean,
                   default: false,
                   desc: 'This should be a developer clone'

      def check_path
        if Dir.exists? path
          remove = false
          say_status :clone, "Directory found!", :yellow

          unless options[:auto]
            remove = yes? "Remove #{path}?"
          end

          if remove || options[:auto]
            FileUtils.rm_rf path
          else
            abort!
          end
        end
      end

      def clone
        execute_clone_cmd!
      end

      def remove_git
        return if options[:developer]
        inside path do
          remove_dir '.git'
        end
      end

      private

      def execute_clone_cmd!
        say_status :clone, "OpenProject (#{options[:branch]}) into #{path}"
        say_status :developer, 'will need a full clone', :green if options[:developer]
        system clone_cmd
      end

      def abort!
        error 'Installation was unsuccessful'
        exit 1
      end

      def clone_cmd
        if options[:developer]
          "git clone --quiet #{options[:repository]} #{path}"
        else
          "git clone --quiet --depth 1 --single-branch --branch #{options[:branch]} #{options[:repository]} #{path}"
        end
      end
    end
  end
end
