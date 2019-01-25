module Renoval
  class Validator
    attr_accessor :file_path, :options

    def initialize(file_path, options={})
      @file_path = file_path
      @options = options
    end

    # Validate the change log
    def validate
      puts 'Validating ...'
    end
  end
end
