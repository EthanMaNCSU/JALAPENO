class AddIndexToRecruitersEmail < ActiveRecord::Migration[5.1]
  def change
    add_index :recruiters, :email, unique: true
  end
end
