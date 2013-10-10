class UserMailer < ActionMailer::Base
  default from: "tracking@example.com"

  def ticket_created(ticket)
    @url  = "http://0.0.0.0:3000/ABC-#{ticket.id}"
    mail(to: ticket.customer_email, subject: "Ticket '#{ticket.subject}' created")
  end

  def reply_created(ticket, reply)
    @url = "http://0.0.0.0:3000/ABC-#{ticket.id}"
    @reply = reply.body
    mail(to: ticket.customer_email, subject: "You have reply for '#{ticket.subject}' ticket")
  end
end
