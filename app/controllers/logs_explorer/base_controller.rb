# frozen_string_literal: true

module LogsExplorer
  class BaseController < ActionController::Base
    include LogsExplorer::ApplicationHelper
    layout 'logs_explorer/layouts/logs_explorer'

    # self.logger = LogsExplorer::SilentLogger.new(config.logger)

    before_action :verify_access

    if LogsExplorer.http_basic_authentication_enabled
      http_basic_authenticate_with \
        name: LogsExplorer.http_basic_authentication_user_name,
        password: LogsExplorer.http_basic_authentication_password
    end

    private

    def verify_access
      result = LogsExplorer.verify_access_proc.call(self)
      redirect_to('/', error: 'Access Denied', status: 401) unless result
    end

  end
end