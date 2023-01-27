# frozen_string_literal: true

require_relative './rails/middleware.rb'

module LogsExplorer
  class Engine < ::Rails::Engine
    isolate_namespace LogsExplorer

    if LogsExplorer.try(:enabled)
      if ::Rails::VERSION::MAJOR.to_i >= 5
        config.app_middleware.insert_after ActionDispatch::Executor, LogsExplorer::Rails::Middleware
      else
        config.app_middleware.insert_after ActionDispatch::Static, LogsExplorer::Rails::Middleware
      end
    end

  end
end