class CreateApplicants < ActiveRecord::Migration[5.1]
  def change
    create_table :applicants do |t|
      t.integer :seen, :null => false, :default => 0
      t.references :user, :null => false, foreign_key: true
      t.references :job, :null => false, foreign_key: true
      t.timestamps
    end
    add_index :applicants, [:user_id, :job_id], :unique => true
  end
end
