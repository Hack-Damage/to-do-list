class User < ActiveRecord::Base
  has_many :requests_sent, class_name: "Partnership", foreign_key: :friender_id, inverse_of: :friender
  has_many :requests_received, class_name: "Partnership", foreign_key: :friendee_id, inverse_of: :friendee
  has_many :comments
  has_many :tasks
end