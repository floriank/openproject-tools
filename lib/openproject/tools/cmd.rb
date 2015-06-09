require 'thor'
require 'openproject/tools'

module Openproject
  module Tools
    class Cmd < Thor
      desc 'new PATH', 'installs a fresh OpenProject instance to a given PATH'
      method_option :auto,
                    type: :boolean,
                    default: false,
                    aliases: %w(-y --yes),
                    desc: %{No questions asked during installation,
                            will assume default configuration}.split.join(' ')
      method_option :branch,
                    type: :string,
                    default: 'dev',
                    aliases: %w(--version -v),
                    desc: 'The branch of OpenProject to use'

      method_option :developer,
                    type: :boolean,
                    default: false,
                    aliases: %w(--full),
                    desc: 'Do a full developer installation'

      method_option :repository,
                    type: :string,
                    aliases: %w(--repo --url),
                    desc: 'The URL to the OpenProject Git repository'
      def new(path)
        Openproject::Install.new.start({ path: path }.merge(options))
      end

      desc 'test PATH', 'run tests for a given plugin at PATH'
      def test(_path = '.')
        puts 'NYI'
      end
    end
  end
end
