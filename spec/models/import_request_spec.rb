require 'rails_helper'

describe ImportRequest do
  fixtures :all

  it 'should import isbn', :vcr => true do
    import_request = ImportRequest.import_isdn('2784702901978')
    expect(import_request).to be_valid
  end
end
