require('rspec')
require('word')
require('define')

describe ('Word') do
  describe('.all') do
    it("returns an empty array when there are no albums") do
      expect(Word.all).to(eq([]))
    end
  end

  describe ('#save') do
    it("saves a word") do
      word = Word.new("Unicorn", nil)
      word.save()
      word2 = Word.new("Peacock", nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end
  
end
