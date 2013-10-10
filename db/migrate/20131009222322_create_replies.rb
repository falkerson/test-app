class CreateReplies < ActiveRecord::Migration
  def change
    create_table 'replies', :force => true do |t|
      t.string :body
      t.integer :ticket_id
      t.integer :user_id
      t.timestamps
    end
  end
end
