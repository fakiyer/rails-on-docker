# redis_config = YAML.load(ERB.new(File.read(Rails.root.join("config/redis.yml.erb"))).result)[Rails.env].symbolize_keys
#
# url = "redis://#{redis_config[:host]}:#{redis_config[:port]}/#{redis_config[:db]}"
# namespace = redis_config[:namespace] + ":sidekiq"
#
# Sidekiq.configure_server do |config|
#   config.redis = { url: url, namespace: namespace }
# end
# Sidekiq.configure_client do |config|
#   config.redis = { url: url, namespace: namespace }
# end
