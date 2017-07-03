feature "index" do
  scenario "main page" do
    visit '/'
    expect(current_path).to eq('/')
  end
end
