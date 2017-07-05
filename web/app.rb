require 'sinatra/base'
require './lib/game'
require './lib/board'
require './web/web_player'
require './lib/simple_computer'
require './lib/perfect_computer'

class Web < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
   erb(:index)
  end

  post '/new-game' do
    board = Board.new(Array.new(9))
    player_x = get_player_type(params[:player_x], "X", session[:move] = [])
    player_o = get_player_type(params[:player_o], "O", session[:move])
    session[:game] = Game.new(board, player_x, player_o)
    redirect '/play'
  end

  get '/play' do
    @game = session[:game]
    p @game.board.spaces
    erb(:play)
  end

  post '/play' do
    @move = session[:move]
    @game = session[:game]
    @move.push(params[:selection].to_i)
    @game.take_turn
    redirect '/play'
  end

  get '/outcome' do
    erb(:outcome)
  end

  def get_player_type(selection, marker, move)
    return WebPlayer.new(marker, move) if selection == "human"
    return SimpleComputer.new(marker) if selection == "simple_computer"
    return PerfectComputer.new(marker) if selection == "expert_computer"
  end

 run! if app_file == $0
end
