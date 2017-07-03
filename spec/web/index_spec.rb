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
end
