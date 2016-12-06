class Contact < ActiveRecord::Base
  validates :email, :owner_id, :name, presence: true
  validates :email, uniqueness: { scope: :owner_id }

  belongs_to :owner,
    dependent: :destroy,
    class_name: :User,
    foreign_key: :owner_id,
    primary_key: :id

  has_many :shares,
    class_name: :ContactShare,
    foreign_key: :contact_id,
    primary_key: :id

  # lists people who this contact has been shared with
  has_many :shared_users,
    through: :shares,
    source: :user
end
