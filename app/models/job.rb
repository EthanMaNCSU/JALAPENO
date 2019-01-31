class Job < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :company
  has_many :applications, dependent: :destroy
  has_many :job_seekers, through: :applications
  validates :description, presence: true, length: {maximum: 2000}
  validates :requirement, presence: true, length: {maximum: 2000}
  validates :responsibility, presence: true, length: {maximum: 2000}
  validates :employment_type, presence: true, length: {maximum: 55 }
  validates :company_id, presence: true, length: {maximum: 55 }
  def self.search(params)
    @jobs = if params[:search]
               Job.where('cast(company_id as text) LIKE?',"%#{params[:search]}%")
             else
               Job.all
             end
    #results
    end
end
