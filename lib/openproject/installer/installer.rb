require 'openproject/installer/clone'

module Openproject
  class Install
    def start(options)
      path = options.fetch :path
      install! path, options
    end

    private

    def install!(path, options)
      [
        Openproject::Installer::Clone.new([path], options),
        Openproject::Installer::Configure.new([path], options)
      ].each(&:invoke_all)
    end
  end
end
