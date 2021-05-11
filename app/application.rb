require 'pry'
require 'json'

class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/cards/) && req.get?
      return [200, {'Content-Type' => 'application/json'}, [Card.all.to_json]]
    end
  end

end
