require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'In Rainbows')
    click_on('Go!')
    expect(page).to have_content('In Rainbows')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    word = Word.new("In Rainbows", nil)
    word.save
    visit("/words/#{word.id}")
    fill_in('definition_name', :with => 'Bodysnatchers')
    click_on('Add definition')
    expect(page).to have_content('Bodysnatchers')
  end
end