# frozen_string_literal: true

require_relative './base_controller.rb'

module LogsExplorer
  class LogsController < LogsExplorer::BaseController

    if LogsExplorer.enabled
      def watch; end

      def changes
        @lines = log_file.readlines
        @total_lines = log_file.total_lines
      end

      def download
        send_file log_file.path
      end

      def log_file
        @log_file ||= begin
          item = LogsExplorer.logs.detect {|e| e[:name] == params[:name]}
          LogFile.new(path: "#{::Rails.root}/#{item[:path]}", client_total_lines: params[:client_total_lines])
        end
      end
    end

  end
end