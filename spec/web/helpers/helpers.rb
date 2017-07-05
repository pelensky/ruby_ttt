module Helpers

  def new_game_two_human
    visit '/'
    select "Human", :from => "player_x"
    select "Human", :from => "player_o"
    click_button "Start Game"
  end

  def two_humans_x_wins
    click_button "btn-0"
    click_button "btn-4"
    click_button "btn-1"
    click_button "btn-6"
    click_button "btn-2"
  end

  def two_humans_o_wins
    click_button "btn-0"
    click_button "btn-4"
    click_button "btn-1"
    click_button "btn-2"
    click_button "btn-3"
    click_button "btn-6"
  end

  def two_humans_tied_game
    click_button "btn-0"
    click_button "btn-4"
    click_button "btn-1"
    click_button "btn-2"
    click_button "btn-5"
    click_button "btn-3"
    click_button "btn-6"
    click_button "btn-7"
    click_button "btn-8"
  end

end
