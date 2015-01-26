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
  enum media_type: { book: 0,
                     article: 1,
                     video: 2,
                     course: 3 }

  belongs_to :user

  # TODO: require media_type, user
  validates_presence_of :title

  after_initialize :set_completed_at

  private

  def set_completed_at
    self.completed_at ||= Time.now
  end
end
