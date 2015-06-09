require 'openproject/installer/clone'
require 'pry'
module Openproject
  class Install
    def start(options)
      path = options.fetch :path
      install! path, options
    end

    private

    def install!(path, options)
      cmd = Openproject::Installer::Clone.new([path], options)
      cmd.invoke_all
    end

    # def symbolize_keys(hash)
    #   hash.inject({}) { |memo,(k,v)| memo[k.to_sym] = v; memo }
    # end
  end
end
