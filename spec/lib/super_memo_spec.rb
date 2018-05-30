require 'rails_helper'

RSpec.describe SuperMemo do
  it 'returns :correct' do
    res = SuperMemo.calculate(
      translated_text: 'Home',
      answer: 'Home',
      step: 1,
      easiness: 2.0,
      interval: 1
    )
    expect(res[:result]).to eq(:correct)
    expect(res[:step]).to eq(1)
  end

  it 'returns :incorrect' do
    res = SuperMemo.calculate(
      translated_text: 'Home',
      answer: 'House',
      step: 1,
      easiness: 2.0,
      interval: 1
    )
    expect(res[:result]).to eq(:incorrect)
    expect(res[:step]).to eq(2)
  end
end
