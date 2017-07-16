require 'rails_helper'

RSpec.describe Applicant, type: :model do
  # Association test
  it { should belong_to(:user) }
  it { should belong_to(:job) }
end
