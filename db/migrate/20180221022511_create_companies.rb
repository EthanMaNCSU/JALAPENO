class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :website
      t.string :headquarters
      t.string :size
      t.date :founded
      t.string :industry
      t.string :revenue
      t.text :synopsis
      t.timestamps
    end
  end
end
