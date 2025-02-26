class User < ApplicationRecord
  has_many :user_documents
  has_many :documents, through: :user_documents
  accepts_nested_attributes_for :user_documents, allow_destroy: true
end
