require 'pry'
require 'json'

class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path == '/board_games' && req.get?
      return [200, {'Content-Type' => 'application/json'}, [BoardGame.all.to_json]]
    elsif req.path.match(/board_games/) && req.get?
      id = req.path.split('/')[2]
      board_game = BoardGame.find(id)
      return [200, {'Content-Type' => 'application/json'}, [board_game.to_json]]
    elsif req.path.match(/board_games/) && req.post?
      data = JSON.parse req.body.read
      new_board_game = BoardGame.create data
      return [201, {'Content-Type' => 'application/json'}, [new_board_game.to_json]]
    elsif req.path.match(/board_games/) && req.patch? 
      id = req.path.split('/')[2]
      board_game = BoardGame.find(id) 
      data = JSON.parse req.body.read
      board_game.update(data)
      return [200, {'Content-Type' => 'application/json'}, [board_game.to_json]]
    elsif req.path.match(/board_games/) && req.delete?
      id = req.path.split('/')[2]
      board_game = BoardGame.find(id)
      board_game.destory
    return  [204, {}, ['']]
    else
      return [404, {}, ['']]
    end
  end

end
