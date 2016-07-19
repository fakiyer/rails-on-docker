# Be sure to restart your server when you modify this file.
# Rails.application.config.session_store :cookie_store, key: '_myapp_session'

redis_config = YAML.load(ERB.new(File.read(Rails.root.join("config/redis.yml.erb"))).result)[Rails.env].symbolize_keys
redis_config[:namespace] += ":session"

Rails.application.config.session_store :redis_store,
                                       servers: {
                                         host: redis_config[:host],
                                         port: redis_config[:port],
                                         db: redis_config[:session_db],
                                         namespace: redis_config[:namespace],
                                       }, expires_in: 1.day
