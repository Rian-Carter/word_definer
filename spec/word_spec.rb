require('rspec')
require('word')
# require('define')

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

  describe ('#==') do
    it("is the same word if it hase the same attributes of another word") do
      word = Word.new("Rainbow", nil)
      word2 = Word.new("Rainbow", nil)
      expect(word).to(eq(word2))
    end
  end

  describe('.clear') do
    it("clears all words") do
      word = Word.new("In Rainbows", nil)
      word.save()
      word2 = Word.new("Yellow", nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

end
