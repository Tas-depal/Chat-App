# frozen_string_literal: true

# User model
class User < ApplicationRecord
  has_many :messages
  validates_uniqueness_of :username
  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to "users" }
end
