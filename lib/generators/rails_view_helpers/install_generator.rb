require 'rails/generators/active_record/migration'

module RailsViewHelpers
  # @private
  module Generators
    # @private
    class InstallGenerator < Rails::Generators::Base
      source_root File.join(File.dirname(__FILE__), "templates")

      desc 'Copy rails_view_helpers files'
      
      def install
        directory 'app/assets'
      end

    end
  end
end