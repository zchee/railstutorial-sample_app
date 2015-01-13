defined?(BetterErrors) && Rails.env == :development
BetterErrors::Middleware.allow_ip! '192.168.77.0/24'
BetterErrors.editor = ->(*args) do
  filename = args[0].sub '/vagrant', '/Users/Chee/Rails/rails-starter/app/sample_app'
  "x-mine://open?file=/#{filename}&line=#{args[1]}&column=#{args[2]}"
end
