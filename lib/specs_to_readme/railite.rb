require 'specs_to_readme'
require 'rails'

module SpecsToReadme
  class Railtie < Rails::Railtie
    railtie_name :specs_to_readme

    rake_tasks do
      path = File.expand_path(__dir__)
      Dir.glob("#{path}/tasks/**/*.rake").each { |f| load f }
    end
  end
end
