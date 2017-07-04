require 'sinatra/base'
require './lib/game'
require './lib/board'
require './lib/player'
require './lib/simple_computer'
require './lib/perfect_computer'

class Web < Sinatra::Base

  get '/' do
   erb(:index)
  end

  post '/new-game' do
    x_selection = params[:player_x]
    o_selection = params[:player_o]
    p get_player_type(x_selection, "X")
    player_x = get_player_type(x_selection, "X")
    player_o = get_player_type(o_selection, "O")
    board = Board.new(Array.new(9))
    @game = Game.new(board, player_x, player_o)
    p @game
    redirect '/play'
  end

  get '/play' do
    erb(:play)
  end


  def get_player_type(selection, marker)
    return Player.new(marker, self) if selection == "human"
    return SimpleComputer.new(marker) if selection == "simple_computer"
    return PerfectComputer.new(marker) if selection == "perfect_computer"
  end

 run! if app_file == $0
end
