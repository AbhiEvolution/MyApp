class Post < ApplicationRecord
  belongs_to :user
  scope :published, -> { where(publish: true) }
  scope :unpublished, -> { where(publish: false)}
  # Ex:- scope :active, -> {where(:active => true)}
end
