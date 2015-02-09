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

class Completion < ActiveRecord::Base
  enum media_type: {
    book: 0,
    article: 1,
    video: 2,
    course: 3
  }

  belongs_to :user

  validates_presence_of :title, :media_type, :user

  after_initialize :ensure_completed_at

  # TODO: remove me once iphone app can interact with devise
  after_initialize :ensure_user

  private

  def ensure_completed_at
    self.completed_at ||= Time.now
  end

  def ensure_user
    self.user ||= User.first
  end
end
