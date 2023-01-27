# frozen_string_literal: true

require_relative './base_controller.rb'

module LogsExplorer
  class HomeController < LogsExplorer::BaseController

    if LogsExplorer.enabled
      def index
        if LogsExplorer.logs.any?
          redirect_to logs_explorer.watch_url(name: LogsExplorer.logs[0][:name])
        else
          render text: 'Please configure initializer: https://github.com/balakirevs/logs_explorer'
        end
      end
    end

  end
end