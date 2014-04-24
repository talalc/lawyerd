class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.date :assigned_date
      t.date :due_date
      t.belongs_to :client
      t.belongs_to :assignment_type

      t.timestamps
    end
  end
end
