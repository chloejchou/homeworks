class Track < ActiveRecord::Base
  TRACK_STATE = %w(bonus regular)

  validates :album_id, :name, :state, presence: true
  validates :state, inclusion: { in: TRACK_STATE }

  belongs_to :album,
    class_name: :Album,
    primary_key: :id,
    foreign_key: :album_id

  has_one :band,
    through: :album,
    source: :band

  has_many :notes,
    class_name: :Note,
    primary_key: :id,
    foreign_key: :track_id

end
