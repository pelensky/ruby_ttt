require 'sinatra/base'
require 'game'
require 'board'
require './web/web_player'
require 'simple_computer'
require 'perfect_computer'

class Web < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
   erb(:index)
  end

  post '/new-game' do
    board = Board.new(Array.new(params[:board_size].to_i ** 2))
    player_x = create_player(params[:player_x], "X", session[:move_queue] = [])
    player_o = create_player(params[:player_o], "O", session[:move_queue])
    session[:game] = Game.new(board, player_x, player_o)
    redirect '/play'
  end

  get '/play' do
    @game = session[:game]
    take_turn_and_redirect if !@game.current_player.is_a? WebPlayer
    erb(:play)
  end

  post '/play' do
    @game = session[:game]
    move = session[:move_queue]
    move.push(params[:selection].to_i)
    take_turn_and_redirect
  end

  get '/outcome' do
    @game = session[:game]
    erb(:outcome)
  end

  def create_player(selection, marker, move_queue)
    return WebPlayer.new(marker, move_queue) if selection == "human"
    return SimpleComputer.new(marker) if selection == "simple_computer"
    return PerfectComputer.new(marker) if selection == "expert_computer"
  end

  def take_turn_and_redirect
    @game.take_turn
    redirect @game.game_over? ? '/outcome' : '/play'
  end

 run! if app_file == $0
end
