class AddPasswordDigestToRecruiters < ActiveRecord::Migration[5.1]
  def change
    add_column :recruiters, :password_digest, :string
  end
end
