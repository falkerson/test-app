# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Status.destroy_all
User.destroy_all
Ticket.destroy_all
# Add statuses into DB
[
  'Waiting for Staff Response', 'Waiting for Customer',
  'On Hold', 'Cancelled', 'Completed'
].each do |name|
  Status.create({:name => name})
end

# Add test users
%w(john_stuff mary_stuff robert_stuff).each do |login|
  User.create({
    :login => "#{login}", :email => "#{login}@test.com",
    :password => 'secret', :password_confirmation => 'secret'
  })
end

# Add tickets
10.times do |i|
  Ticket.create({
    :customer_name => "customer_#{i}",
    :customer_email => "customer_#{i}@test.com",
    :subject => "subject_#{i}",
    :body => "Some content",
    :status => Status.find_by_name('Waiting for Staff Response')
  })
end
