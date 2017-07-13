require 'rails_helper'

RSpec.describe Job, type: :model do
  # Association test
  it { should belong_to(:user) }

  # Validation test
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
end
