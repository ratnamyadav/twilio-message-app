class TwilioBooksController < ApplicationController
  before_action :set_twilio_book, only: [:show, :edit, :update, :destroy]

  # GET /twilio_books
  # GET /twilio_books.json
  def index
    @twilio_books = TwilioBook.all
  end

  # GET /twilio_books/1
  # GET /twilio_books/1.json
  def show
  end

  # GET /twilio_books/new
  def new
    @twilio_book = TwilioBook.new
  end

  # GET /twilio_books/1/edit
  def edit
  end

  # POST /twilio_books
  # POST /twilio_books.json
  def create
    @twilio_book = TwilioBook.new(twilio_book_params)

    respond_to do |format|
      if @twilio_book.save
        message = "The twilio message '#{@twilio_book.message_name}' was just added."
        TwilioTextMessenger.new(message).call
        format.html { redirect_to @twilio_book, notice: 'Twilio book was successfully created.' }
        format.json { render :show, status: :created, location: @twilio_book }
      else
        format.html { render :new }
        format.json { render json: @twilio_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /twilio_books/1
  # PATCH/PUT /twilio_books/1.json
  def update
    respond_to do |format|
      if @twilio_book.update(twilio_book_params)
        format.html { redirect_to @twilio_book, notice: 'Twilio book was successfully updated.' }
        format.json { render :show, status: :ok, location: @twilio_book }
      else
        format.html { render :edit }
        format.json { render json: @twilio_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twilio_books/1
  # DELETE /twilio_books/1.json
  def destroy
    @twilio_book.destroy
    respond_to do |format|
      format.html { redirect_to twilio_books_url, notice: 'Twilio book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twilio_book
      @twilio_book = TwilioBook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def twilio_book_params
      params.require(:twilio_book).permit(:message_name, :message_description)
    end
end
