# frozen_string_literal: true

LogsExplorer::Engine.routes.draw do
  get '/' => 'home#index', as: :home
  get '/watch' => 'logs#watch', as: :watch
  get '/watch/changes' => 'logs#changes', as: :changes
  get '/watch/download' => 'logs#download', as: :download

  get '/console' => 'console#index', as: :console
  post '/execute' => 'console#execute', as: :execute

  get '/call' => 'commands#call', as: :call

  %w[ansi_up.js.map perfect-scrollbar.min.js.map bulmaswatch.min.css.map ansi_up.js.map perfect-scrollbar.min.js.map bulmaswatch.min.css.map].each do |res|
    get "/#{res}", to: -> (env) do
      [200, { 'Content-Type' => 'text/plain' }, ['']]
    end
  end
end

Rails.application.routes.draw do
  begin
    mount LogsExplorer::Engine => LogsExplorer.mount_at, as: 'logs_explorer'
  rescue ArgumentError
    # already added
  end
end