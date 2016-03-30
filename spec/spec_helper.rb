$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'justrecord'
require 'support/ar_test'

SPEC_ROOT = File.expand_path(File.dirname(__FILE__))
SUPPORT_ROOT = SPEC_ROOT + "/support"

ARTest.connect

def load_schema
  # silence verbose schema loading
  original_stdout = $stdout
  $stdout = StringIO.new

  adapter_name = ActiveRecord::Base.connection.adapter_name.downcase
  adapter_specific_schema_file = SPEC_ROOT + "/schema.rb"

  load SPEC_ROOT + "/schema.rb"

  if File.exist?(adapter_specific_schema_file)
    load adapter_specific_schema_file
  end
ensure
  $stdout = original_stdout
end

load_schema

