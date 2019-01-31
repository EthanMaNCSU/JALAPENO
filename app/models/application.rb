class Application < ApplicationRecord
  belongs_to :job
  belongs_to :job_seeker
  default_scope -> { order(created_at: :desc) }
  mount_uploader :document, DocumentUploader
  validates :current_company, presence:true, length:{ maximum: 255 }
  validates :linkedin_url, presence:true, length: { maximum: 255 }
  validates :portfolio_url, presence:true, length: { maximum: 255 }
  validates :additional_information, presence:true, length: { maximum: 2000 }
  validates :gender, presence:true, length: { maximum: 255 }
  validates :race, presence:true, length: { maximum: 255 }
  validates :veteran_status, presence:true, length: { maximum: 255 }
  validates :disability_status, presence:true, length: { maximum: 255 }
  validates :job_id, presence:true, length: {maximum: 255 }
  validates :job_seeker_id, presence:true, length: {maximum: 255 }
  validates :document, presence:true
end
