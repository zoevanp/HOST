class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking_id = @booking.id
    if @review.save
      redirect_to bookings_path
    else
      redirect_to error_page_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
