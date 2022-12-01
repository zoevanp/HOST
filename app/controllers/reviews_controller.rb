class ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
    @refugee = @review.booking.refugee
    @refugee.average = get_average_rating(@refugee)
  end

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

  def get_average_rating(refugee)
    refugee_reviews = refugee.bookings_as_refugee.map { |booking| booking.review }
    refugee_reviews.map {|review| review.rating}.sum / refugee_reviews.size
  end
end
