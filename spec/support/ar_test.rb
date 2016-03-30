module ARTest
  class << self
    def config
      @config ||= read_config
    end

    private

    def config_file
      Pathname.new(ENV['ARCONFIG'] || SPEC_ROOT + '/config.yml')
    end

    def read_config
      unless config_file.exist?
        FileUtils.cp SPEC_ROOT + '/config.example.yml', config_file
      end

      erb = config_file.read
      expand_config(YAML.parse(erb).transform)
    end

    def expand_config(config)
      config['connections'].each do |adapter, connection|
        dbs = [['arunit', 'activerecord_unittest']]
        dbs.each do |name, dbname|
          unless connection[name].is_a?(Hash)
            connection[name] = { 'database' => connection[name] }
          end

          connection[name]['database'] ||= dbname
          connection[name]['adapter']  ||= adapter
        end
      end

      config
    end
  end

  def self.connection_name
    ENV['ARCONN'] || config['default_connection']
  end

  def self.connection_config
    config['connections'][connection_name]
  end

  def self.connect
    puts "Using #{connection_name}"
    ActiveRecord::Base.logger = ActiveSupport::Logger.new("debug.log", 0, 100 * 1024 * 1024)
    ActiveRecord::Base.configurations = connection_config
    ActiveRecord::Base.establish_connection :arunit
  end
end

