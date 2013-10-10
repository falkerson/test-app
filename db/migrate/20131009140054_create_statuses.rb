class CreateStatuses < ActiveRecord::Migration
  def change
    create_table 'statuses', :force => true do |t|
      t.string :name,  :limit => 100
    end
    add_index :statuses, :name, :unique => true
  end
end
