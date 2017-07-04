feature "play" do
  before :each do
    new_game_two_human
  end

  scenario "shows the current player" do
    expect(page).to have_content "X, take your turn"
  end
end
