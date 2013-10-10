class RepliesController < ApplicationController

  def create
    @ticket = Ticket.find(params[:ticket_id])
    @reply = Reply.new(params[:reply])
    @reply.ticket = @ticket
    @reply.user = current_user if current_user

    if @reply.save
      UserMailer.reply_created(@ticket, @reply).deliver if current_user
      redirect_to ticket_path(@ticket)
    else
      render 'tickets/show'
    end
  end
end