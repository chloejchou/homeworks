class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :contacts,
    class_name: :Contact,
    foreign_key: :owner_id,
    primary_key: :id

  has_many :shares,
    class_name: :ContactShare,
    foreign_key: :user_id,
    primary_key: :id

  # returns a list of contacts shared with user
  has_many :shared_contacts,
    through: :shares,
    source: :contact
end
