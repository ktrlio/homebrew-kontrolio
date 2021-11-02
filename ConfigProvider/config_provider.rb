require 'json'

class ConfigProvider
    CONFIG_DIR = File.join(File.dirname(__FILE__), "..", "bottle-configs")

    def initialize(name, config_file_path=nil)
        unless config_file_path.nil?
            file = File.read(config_file_path) 
        else 
            file = File.read(File.join(CONFIG_DIR, "#{name.downcase}.json"))
        end

        @config_data = JSON.parse(file)
    end

    def name
        @config_data['name']
    end

    def version
        @config_data['version']
    end

    def bin
        @config_data['bin']
    end

    def url
        @config_data['url']
    end

    def sha256
        @config_data['sha256']
    end

    def root_url
        @config_data['bottle']['root_url']
    end

    def sierra_hash
        @config_data['bottle']['sha256']['sierra']
    end

    def arm64_big_sur_hash
        @config_data['bottle']['sha256']['arm64_big_sur']
    end

    def linux_hash
        @config_data['bottle']['sha256']['linux']
    end

    def linux_arm_hash
        @config_data['bottle']['sha256']['linux_arm']
    end

    def sierra_url
        @config_data['bottle']['url']['sierra']
    end

    def linux_url
        @config_data['bottle']['url']['linux']
    end
end