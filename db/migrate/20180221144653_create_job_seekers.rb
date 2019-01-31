class CreateJobSeekers < ActiveRecord::Migration[5.1]

  def change
    create_table :job_seekers do |t|
      t.string :email
      t.string :name
      t.string :full_name
      t.string :phone
      t.timestamps
    end
  end

end
