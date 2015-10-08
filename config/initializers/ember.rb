EmberCLI.configure do |c|
  c.app :stock_app,
    path: "app/assets/javascripts/stock_app",
    enable: -> path { path.starts_with?("/app") }
end
