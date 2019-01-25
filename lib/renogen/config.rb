require 'singleton'
require 'yaml'

module Renogen
  # Stores configuratin values to be used by the libary
  class Config
    include Singleton
    attr_accessor :single_line_format, :input_source, :output_format, :supported_keys, :changelog_path, :default_headings, :validate

    def initialize
      config_file = load_yaml_config
      self.single_line_format = config_file['single_line_format'] || 'summary (see link)'.freeze
      self.supported_keys = config_file['supported_keys'] || ['identifier', 'link', 'summary'].freeze
      self.input_source = config_file['input_source'] || 'yaml'.freeze
      self.output_format = config_file['output_format'] || 'markdown'.freeze
      self.changelog_path = config_file['changelog_path'] || './change_log'.freeze
      self.default_headings = config_file['default_headings'] || %w(Summary Detailed Tasks).freeze
      self.validate = load_validate_config
    end


    # Renogen configuration extension
    # a block can be provided to programatily setup configuration values
    def self.configure
      yield instance
    end

    private

    def load_yaml_config(config_file_path='.renogen')
      begin
        YAML.load_file(config_file_path)
      rescue
        {}
      end
    end

    def load_validate_config
      filename = '.renoval'
      return unless File.file?(filename)
      config_file = load_yaml_config(filename)
      [
        url: config_file['url'] || 'https://jira.sage.com/browse/'.freeze,
        bug_ticket: config_file['bug_ticket'] || 'AC-'.freeze,
        squad_ticket: config_file['squad_ticket'] || ''.freeze
      ]
    end
  end
end
