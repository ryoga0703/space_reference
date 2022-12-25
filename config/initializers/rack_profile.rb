# 'rack-mini-profiler'はdevelopment環境のみ使用する
if Rails.env.development?
  Rack::MiniProfiler.config.start_hidden = true
end