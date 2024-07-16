# frozen_string_literal: true

parent_name_method = Rails.application.class.respond_to?(:module_parent_name) ? :module_parent_name : :parent_name
Rails.application.class.send(parent_name_method).constantize::Application.load_tasks if defined?(Rails)

require_relative './base_controller.rb'

module LogsExplorer
  class ConsoleController < LogsExplorer::BaseController

    if LogsExplorer.enabled && LogsExplorer.console
      def index; end

      def execute
        @result = eval(params[:code])
      rescue Exception => ex
        @result = ex.message
      end
    end

  end
end