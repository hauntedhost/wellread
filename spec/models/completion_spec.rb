# == Schema Information
#
# Table name: completions
#
#  id           :integer          not null, primary key
#  title        :string
#  summary      :text
#  user_id      :integer
#  media_type   :integer
#  link         :text
#  completed_at :datetime
#  image        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Completion, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:completion)).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:media_type) }
    it { should validate_presence_of(:user) }
  end
end
