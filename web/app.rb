require 'sinatra/base'
require './lib/game'
require './lib/board'
require './lib/player'
require './lib/simple_computer'
require './lib/perfect_computer'

class Web < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
   erb(:index)
  end

  post '/new-game' do
    player_x = get_player_type(params[:player_x], "X")
    player_o = get_player_type(params[:player_o], "O")
    board = Board.new(Array.new(9))
    session[:game] = Game.new(board, player_x, player_o)
    redirect '/play'
  end

  get '/play' do
p    @game = session[:game]
    erb(:play)
  end


  def get_player_type(selection, marker)
    return Player.new(marker, nil) if selection == "human"
    return SimpleComputer.new(marker) if selection == "simple_computer"
    return PerfectComputer.new(marker) if selection == "perfect_computer"
  end

 run! if app_file == $0
end
