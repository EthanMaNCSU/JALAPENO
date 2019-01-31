class Company < ApplicationRecord
  has_many :recruiters
  has_many :jobs,dependent: :destroy

  VALID_URL_REGEX=/((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/i
  validates :name, presence: true, length: { maximum: 255 }
  validates :website, presence: true, length: { maximum: 255 }, format: { with: VALID_URL_REGEX }
  validates :headquarters, presence: true, length: { maximum: 255 }
  validates :size, presence: true, length: { maximum: 255 }
  validates :founded, presence: true
  validates :industry, presence: true, length: { maximum: 255 }
  validates :revenue, presence: true, length: { maximum: 255 }
  validates :synopsis, presence: true, length: { maximum: 2000 }
end
