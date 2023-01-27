# frozen_string_literal: true

require_relative './base_controller.rb'

module LogsExplorer
  class CommandsController < LogsExplorer::BaseController

    if LogsExplorer.enabled
      def call
        item = LogsExplorer.commands.detect {|e| e[:name] == params[:name]}
        @result, status = Open3.capture2e(item[:command])
      end
    end

  end
end