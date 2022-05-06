require('rspec')
require('word')
require('define')

describe ('Word') do
  describe('.all') do
    it("returns an empty array when there are no albums") do
      expect(Word.all).to(eq([]))
    end
  end
end
