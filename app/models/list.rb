class List < ActiveRecord::Base
  has_many :tasks
  has_many :user_lists
  has_many :users, through: :user_lists

  validates_presence_of :name, uniqueness: true

  accepts_nested_attributes_for :tasks
end
