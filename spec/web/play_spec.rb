feature "play" do
  before :each do
    new_game_two_human
  end

  scenario "shows the current player" do
    expect(page).to have_content "X, take your turn"
  end

  scenario "has all elements that will make up the tic tac toe board" do
    (0..8).each { |number| expect(page).to have_css("#td-" + number.to_s) }
  end
end
