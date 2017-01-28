require 'rails_helper'

describe Manifestation do
  fixtures :all

  it 'should import isbn', :vcr => true do
    m = Manifestation.import_isdn('2784702901978')
    expect(m).to be_valid

    expect(m.original_title).to eq 'みほん同人誌'
    expect(m.title_transcription).to eq 'みほんどうじんし'
    expect(m.pub_date).to eq '2008-03-12'
    expect(m.price).to eq 100
  end
end
