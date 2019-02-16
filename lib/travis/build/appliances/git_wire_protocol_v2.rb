require 'travis/build/appliances/base'

module Travis
  module Build
    module Appliances
      class GitWireProtocolV2 < Base
        
        def is_xcode93?
          !data[:config][:osx_image].to_s.empty? && %w[xcode9.3 xcode9.3-moar].include?(data[:config][:osx_image])
        end
        
        def is_android_edge?
          !data[:config][:language].to_s.empty? && data[:config][:language] == "android" &&
          !data[:config][:group].to_s.empty? && data[:config][:group] == "edge"
            
        end

        def apply?
          !is_xcode93? && !is_android_edge?
        end

        def apply
          sh.cmd "git config --global protocol.version 2", assert: false, echo: false
        end

      end
    end
  end
end
