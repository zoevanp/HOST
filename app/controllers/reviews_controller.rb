class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking_id = @booking.id
    # @review.booking.room.host.id = current_user.id
    @refugee = @review.booking.refugee
    @review.save
    if @refugee.average_rating.nil?
      @refugee.average_rating = @review.rating
    else
      get_average_rating(@refugee)
    end
    @refugee.save
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
    @refugee_reviews = refugee.bookings_as_refugee.map { |booking| booking.review }.reject {|review| review.nil?}
    unless @refugee_reviews.empty?
      @refugee.average_rating = @refugee_reviews.map { |review| review.rating }.sum / @refugee_reviews.size
      @refugee.save
    end
  end
end
