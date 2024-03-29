# frozen_string_literal: true

module LogsExplorer
  module Rails
    class Middleware
      def initialize(app)
        @app = app
      end

      def call(env)
        dup.call!(env)
      end

      def call!(env)
        if env['PATH_INFO'] =~ /logs-explorer/
          # in_silence { @status, @headers, @response = @app.call(env) }
          ::Rails.logger.silence do
            @status, @headers, @response = @app.call(env)
          end
        else
          @status, @headers, @response = @app.call(env)
        end

        [@status, @headers, @response]
      end

      def in_silence
        old_level = ::Rails.logger.level.dup
        begin
          ::Rails.logger.level = Logger::ERROR
          yield
        ensure
          ::Rails.logger.level = old_level
        end
      end

    end
  end
end