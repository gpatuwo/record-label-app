# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  band_id    :integer          not null
#  year       :integer          not null
#  live       :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base
  belongs_to :band
  has_many :tracks

  validates :title, :band, :year, presence: true
  validates :live, inclusion: {in: [true, false]}
  validates :title, uniqueness: {scope: :band_id}
end
