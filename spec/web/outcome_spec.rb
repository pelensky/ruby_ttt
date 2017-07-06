feature "outcome" do
  before :each do
    new_game_two_human
  end

  scenario "play again" do
    two_humans_x_wins
    expect(page).to have_content "Play Again"
  end

  scenario "two humans, x wins" do
    two_humans_x_wins
    expect(page).to have_content "X is the winner"
  end

  scenario "two humanx, o wins" do
    two_humans_o_wins
    expect(page).to have_content "O is the winner"
  end

  scenario "two humans, tied game" do
    two_humans_tied_game
    expect(page).to have_content "Tied Game"
  end
end
