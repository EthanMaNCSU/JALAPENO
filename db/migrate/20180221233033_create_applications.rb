class CreateApplications < ActiveRecord::Migration[5.1]
    def change
      create_table :applications do |t|
        t.string :current_company
        t.string :linkedin_url
        t.string :portfolio_url
        t.text :additional_information
        t.string :gender
        t.string :race
        t.string :veteran_status
        t.string :disability_status
        t.references :job, foreign_key: true
        t.references :job_seeker, foreign_key: true
        t.timestamps
      end

      add_column :applications, :status, :string, default: "In process"
    end
  end
