class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :name
      t.string :description
      t.date :duedate

      t.timestamps
    end
  end
end
