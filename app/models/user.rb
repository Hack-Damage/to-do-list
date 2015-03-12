class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_uniqueness_of    :email,     :case_sensitive => false, :allow_blank => true, :if => :email_changed?
  has_many :comments
  has_many :tasks
  has_one :partner_primary, class_name: "User", foreign_key: :partner_id, inverse_of: :partner
  belongs_to :partner, class_name: "User", foreign_key: :partner_id, inverse_of: :partner_primary
  accepts_nested_attributes_for :tasks
end