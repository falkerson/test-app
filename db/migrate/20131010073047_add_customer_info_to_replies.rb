class AddCustomerInfoToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :customer_name, :string
    add_column :replies, :customer_email, :string
  end
end
