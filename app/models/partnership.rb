class Partnership < ActiveRecord::Base
  # belongs_to :friender, class_name: "User", foreign_key: :friender_id, inverse_of: :requests_sent
  # belongs_to :friendee, class_name: "User", foreign_key: :friendee_id, inverse_of: :requests_received

  belongs_to :friender, class_name: 'User', foreign_key: :friender_id
  belongs_to :friendee, class_name: 'User', foreign_key: :friendee_id

  has_many :comments

end
