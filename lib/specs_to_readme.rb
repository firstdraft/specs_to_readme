require "specs_to_readme/version"

module SpecsToReadme
  class Error < StandardError; end
  require 'specs_to_readme/railite' if defined?(Rails)
end
