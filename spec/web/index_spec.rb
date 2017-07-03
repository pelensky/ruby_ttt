feature "index" do
  scenario "main page" do
    visit '/'
    expect(current_path).to eq('/')
    (0..8).each { |number| expect(page).to have_css("#" + number.to_s) }
  end
end
