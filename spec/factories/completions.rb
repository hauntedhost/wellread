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

FactoryGirl.define do
  factory :completion do
    media_type { Completion.media_types.keys.sample }
    sequence(:title) { |n| "My Title #{n}" }
    association :user
  end
end
