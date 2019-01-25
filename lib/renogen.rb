# Renogen is a development tool.
# It makes it easier and faster to produce changelogs and release notes
# It works by stopping merge confics and decouping the change notes from releaes versions
module Renogen
  require_relative 'renogen/version'
  require_relative 'renogen/exceptions'
  require_relative 'renogen/formatters'
  require_relative 'renogen/extraction_stratagies'
  require_relative 'renogen/change_log'
  require_relative 'renogen/generator'
  require_relative 'renogen/config'
end
