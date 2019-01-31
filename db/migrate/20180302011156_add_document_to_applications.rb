class AddDocumentToApplications < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :document, :string
  end
end
