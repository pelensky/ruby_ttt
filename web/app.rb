require 'sinatra/base'
require './lib/game'
require './lib/board'
require './web/web_player'
require './lib/simple_computer'
require './lib/perfect_computer'

class Web < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  move = []

  get '/' do
   erb(:index)
  end

  post '/new-game' do
    board = Board.new(Array.new(9))
    player_x = get_player_type(params[:player_x], "X")
    player_o = get_player_type(params[:player_o], "O")
    session[:game] = Game.new(board, player_x, player_o)
    redirect '/play'
  end

  get '/play' do
    @game = session[:game]
    
    erb(:play)
  end

  get '/outcome' do
    erb(:outcome)
  end

  def get_player_type(selection, marker)
    return WebPlayer.new(marker, []) if selection == "human"
    return SimpleComputer.new(marker) if selection == "simple_computer"
    return PerfectComputer.new(marker) if selection == "expert_computer"
  end

 run! if app_file == $0
end
