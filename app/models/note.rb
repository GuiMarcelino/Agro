class Note < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  validates :content, presence: true, length: { minimum: 10 }
end
