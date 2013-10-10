class CreateTickets < ActiveRecord::Migration
  def change
    create_table 'tickets', :force => true do |t|
      t.string :customer_name,  :limit => 100
      t.string :customer_email, :limit => 100
      t.string :subject,        :limit => 100
      t.string :body
      t.timestamps
    end
    add_index :tickets, :subject, :unique => true
  end
end
