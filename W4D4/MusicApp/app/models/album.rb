class Album < ActiveRecord::Base
  ALBUM_STATE = %w(live studio)

  validates :band_id, :name, :state, presence: true
  validates :state, inclusion: { in: ALBUM_STATE }

  belongs_to :band,
    class_name: :Band,
    primary_key: :id,
    foreign_key: :band_id

  has_many :tracks,
    class_name: :Track,
    primary_key: :id,
    foreign_key: :album_id,
    dependent: :destroy

end
