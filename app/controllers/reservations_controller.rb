class ReservationsController < ApplicationController

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    UserMailer.welcome_email(@reservation.user.email).deliver
    if @reservation.save
      redirect_to restaurants_path, alert: "Reservation Sent!"
    else
      render :new
    end
  end

  def index
    @reservations = current_user.reservations
  end

  def destroy
    Reservation.find(params[:id]).destroy
    redirect_to reservations_path
  end

private

  def reservation_params
    params.require(:reservation).permit(:email, :date, :time, :guests, :comment, :user_id, :restaurant_id)
  end

end