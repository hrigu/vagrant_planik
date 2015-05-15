# config.ru
require 'rack'

class HelloApp
  def self.call(env)
    sleep 2
    [200, {'Content-Type' => 'text/html'}, ["Hello there."]]
  end
end

run HelloApp
