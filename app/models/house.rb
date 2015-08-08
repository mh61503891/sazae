# == Schema Information
#
# Table name: houses
#
#  id                :integer          not null, primary key
#  title             :string           not null
#  owner_type        :string           not null
#  owner             :string
#  address           :string
#  first_vacant_year :integer
#  latitude          :float
#  longitude         :float
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

# 物件情報を意味します
#
class House < ActiveRecord::Base

  validates :title, presence: true

  validates :owner_type,
    inclusion: { in: %w(corporation individual) }

  validates :owner,
    length: { maximum: 32 }

  validates :address,
    length: { maximum: 128 }

  validates :first_vacant_year,
    numericality: { only_integer: true, greater_than: 1950 }

  validates :latitude,
    numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }

  validates :longitude,
    numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

  after_initialize :set_defaults
  before_validation :normalize

  has_many :comments, dependent: :destroy

  def location
    Location.new(latitude, longitude) if latitude? && longitude?
  end

  private

  def set_defaults
    if new_record?
      self.owner_type ||= 'corporation'
    end
  end

  def normalize
    self.owner_type = self.owner_type.to_s.downcase
  end
end

