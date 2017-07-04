module Helpers

  def new_game_two_human
    visit '/'
    select "Human", :from => "player_x"
    select "Human", :from => "player_o"
    click_button "Start Game"
  end

end
