class AddPasswordDigestToJobSeekers < ActiveRecord::Migration[5.1]
  def change
    add_column :job_seekers, :password_digest, :string
  end
end
