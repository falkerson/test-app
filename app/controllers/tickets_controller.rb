class TicketsController < ApplicationController

  before_filter :authenticate, :only => [:take_ticket, :change_status, :change_owner, :get_tickets]

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(params[:ticket])
    @ticket.status = Status.find_by_name('Waiting for Staff Response')

    if @ticket.save
      UserMailer.ticket_created(@ticket).deliver
      redirect_to :action => :index
    else
      render 'new'
    end
  end

  def index
    if current_user
      @tickets = Ticket.joins(:status)
        .joins('LEFT OUTER JOIN users ON tickets.user_id = users.id')
        .where('statuses.name in ("Waiting for Customer", "On Hold") AND
                users.login = :login', :login => current_user.login)
    else
      @tickets = Ticket.all
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def take_ticket
    @ticket = Ticket.find(params[:id])

    @ticket.status = Status.find_by_name('On Hold')
    @ticket.user = current_user

    if @ticket.save
      redirect_to root_path
    else
      render 'show'
    end
  end

  def change_status
    @ticket = Ticket.find(params[:id])
    @ticket.status = Status.find(params[:status_id])
    @ticket.save

    render :nothing => true
    #respond_to do |format|
    #  format.js
    #  format.json {}
    #end
  end

  def change_owner
    @ticket = Ticket.find(params[:id])
    @ticket.user = User.find(params[:user_id])
    @ticket.save

    render :nothing => true
  end

  def get_tickets
    case params[:tab]
      when 'unassigned'
        @tickets = Ticket.joins(:status)
          .where('statuses.name IN ("Waiting for Staff Response")')
      when 'open'
        @tickets = Ticket.joins(:status)
          .where('statuses.name IN ("Waiting for Customer")')
      when 'on_hold'
        @tickets = Ticket.joins(:status)
          .where('statuses.name IN ("On Hold")')
      when 'closed'
        @tickets = Ticket.joins(:status)
          .where('statuses.name IN ("Completed", "Cancelled")')
      else
    end

    render @tickets
  end

end