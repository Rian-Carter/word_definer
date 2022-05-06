require('rspec')
require('word')
# require('define')

describe ('Word') do
  before(:each) do
    Word.clear()
  end

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

  describe('.find') do
    it("finds a word by id") do
      word = Word.new("In Rainbows", nil)
      word.save()
      word2 = Word.new("Yellow", nil)
      word2.save()
      expect(Word.find(word.id)).to(eq(word))
    end
  end

  describe('#update') do
    it("updates a word by id") do
      word = Word.new("In Rainbows", nil)
      word.save()
      word.update("At This Height")
      expect(word.name).to(eq("At This Height"))
    end
  end

end
