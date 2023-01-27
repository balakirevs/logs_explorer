# frozen_string_literal: true

require_relative './base_controller.rb'

module LogsExplorer
  class ConsoleController < LogsExplorer::BaseController

    if LogsExplorer.enabled && LogsExplorer.console
      def index
      end

      def execute
        @result = eval(params[:code])
      rescue Exception => ex
        @result = ex.message
      end
    end

  end
end