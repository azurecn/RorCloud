class CreateKpFiles < ActiveRecord::Migration
  def change
    create_table :kp_files do |t|
      t.string :sha1
      t.string :is_delete
      t.integer :rev
      t.string :name
      t.date :create_time
      t.date :modify_time
      t.integer :share_id
      t.integer :size
      t.string :type
      t.string :file_id

      t.timestamps
    end
  end
end
