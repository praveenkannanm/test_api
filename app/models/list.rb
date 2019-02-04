class List < ApplicationRecord
  belongs_to :owner, :class_name => 'User', :foreign_key => 'created_by'
  has_many :list_users, dependent: :destroy
  has_many :users, through: :list_users

  validates :title, presence: true
end

