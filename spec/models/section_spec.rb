require 'rails_helper'

describe Section do
  it { should validate_presence_of :name }
  it { should validate_presence_of :chapter_id }
  it { should have_many :lessons }
  it { should belong_to :chapter }

end
