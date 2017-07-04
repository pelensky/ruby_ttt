feature "index" do
  before :each do
    visit '/'
  end

  scenario "directs to the right page" do
    expect(current_path).to eq('/')
  end

  scenario "shows a title" do
    expect(page).to have_content "Tic Tac Toe"
  end

  scenario "has all elements that will make up the tic tac toe board" do
    (0..8).each { |number| expect(page).to have_css("#" + number.to_s) }
  end

  scenario "set up game" do
    expect(page).to have_content "Player 'X' is a: "
    expect(page).to have_select "player_x", options: ["Human", "Simple Computer", "Expert Computer"]
    expect(page).to have_content "Player 'O' is a: "
    expect(page).to have_select "player_o", options: ["Human", "Simple Computer", "Expert Computer"]
    expect(page).to have_button "submit", "Start Game"
  end

  scenario "set up game with two humans" do
    new_game_two_human
    expect(current_path).to eq('/play')
  end


end
