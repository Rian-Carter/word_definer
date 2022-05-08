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
    word.save()
    visit("/words/#{word.id}")
    fill_in('definition_name', :with => 'Bodysnatchers')
    click_on('Definition')
    expect(page).to have_content('Bodysnatchers')
  end
end

describe('edit a word', {:type => :feature}) do
  it("edits a word and returns to word page") do
    word = Word.new("Roundabout", nil)
    word.save()
    visit("/words/#{word.id}")
    click_on("Edit Word")
    fill_in("Change Word", :with => "Paradise")
    click_on("Update")
    expect(page).to have_content("Paradise")
  end
end

describe('edit a definition', {:type => :feature}) do
  it("edits a words definition and returns to word page") do
    word = Word.new("Sailboat", nil)
    word.save()
    definition = Definition.new("wind powered boat", word.id, nil)
    definition.save()
    visit("/words/#{word.id}/definitions/#{definition.id}")
    fill_in("Definition", :with => "boat powered by wind")
    click_on("Update")
    expect(page).to have_content("boat powered by wind")
  end
end

describe('delete a word', {:type => :feature}) do
  it("deletes a word and returns to word page") do
    word = Word.new("Sailboat", nil)
    word.save()
    visit("/words/#{word.id}")
    click_on("Edit Word")
    click_on("Delete Word")
    expect(page).to have_content("")
  end
end

describe("deletes a definition", { :type => :feature }) do
  it("delete a definition and return to word page") do
    word = Word.new("Sailboat", nil)
    word.save()
    definition = Definition.new("wind powered boat", word.id, nil)
    definition.save()
    visit("/words/#{word.id}/definitions/#{definition.id}")
    click_on("Delete")
    expect(page).to(have_content(""))
  end
end
