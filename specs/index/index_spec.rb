require_relative '../test_helper'

describe Forum do
  it 'it works' do
    get '/'
    last_response.status.must_equal 200
  end
end
