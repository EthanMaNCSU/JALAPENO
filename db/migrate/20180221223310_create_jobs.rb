class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.text :description
      t.text :responsibility
      t.text :requirement
      t.string :employment_type
      t.references :company, foreign_key: true
      t.timestamps
    end
 end
end
