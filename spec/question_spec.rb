require 'question'

describe 'Question' do
  describe '#find_by_id' do
    it 'returns the question object based on id' do
      expect(Question.find_by_id(1)).to be_an_instance_of(Question)
    end
  end
end
