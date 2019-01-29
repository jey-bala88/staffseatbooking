class BookingSeatController < ApplicationController
  before_action :authenticate_user!
	layout 'main', :except => [:show, :new, :view_user_bookings, :edit, :update]
	def index
	  output_json_with_data(
      {
        :content => get_booked_seats_list,
        :current_user_name => current_user.name
      }
    )
	end

  def create
    booked_seats = BookSeat.where('desk_id=?', input_new_params[:desk_id])
    if booked_seats.empty?
      book_seat = BookSeat.new
      book_seat.user_id = current_user.id
      book_seat.desk_id = input_new_params[:desk_id]
      book_seat.start_date = input_new_params[:start_date]
      book_seat.end_date = input_new_params[:end_date]
      book_seat.save!
      if book_seat
        redirect_to '/'
      else
        flash[:notice] = 'Seat is already booked!'
        render new_booking_seat_path
      end
    else
      flash[:notice] = 'Seat is already booked!'
      redirect_to new_booking_seat_path
    end
  end

  def show
    @booked_data=BookSeat.find_by_id(params[:id])
  end

  def edit
    @booked_data=BookSeat.find_by_id(params[:id])
  end

  def update
    booked_seats = BookSeat.where('desk_id=?', params["desk_id"])
    if booked_seats.empty?
      @booked_data=BookSeat.find_by_id(params["id"])
      @booked_data.update_attributes(
        desk_id: params["desk_id"],
        start_date: params["start_date"],
        end_date: params["end_date"]
      )
    else
      flash[:notice] = 'Seat is already booked!'
      redirect_to edit_booking_seat_path and return
    end
    redirect_to view_user_bookings_path
  end

  def cancel
    @booked_data=BookSeat.find_by_id(params["id"])
    @booked_data.update_attributes(is_cancelled: true)
    flash[:notice] = 'Cancelled the booked seat!'
    redirect_to view_user_bookings_path
  end

  def view_user_bookings
    @user_booked_datas = current_user.book_seats.where(is_cancelled: nil)
  end

  private
  def get_booked_seats_list
    parent_data=[]
    BookSeat.order("created_at DESC").each do |booked_seat|
      data={}
      data[:id] = booked_seat.id
      data[:user_name] = booked_seat.user.nil? ? '' : booked_seat.user.name
      data[:desk] = booked_seat.desk.nil? ? '' : booked_seat.desk.name
      data[:date_range] = "#{booked_seat.start_date} - #{booked_seat.end_date}"
      parent_data << data
    end
    return parent_data
  end
  def input_new_params
    ActionController::Parameters.permit_all_parameters = true
    params.permitted?
    params
  end
end
