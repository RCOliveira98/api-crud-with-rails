class PhonesController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy, :create]

  # GET /phones
  def index
    @phones = Phone.all

    render json: @phones
  end

  # GET /phones/1
  def show
    render json: @contact.phones
  end

  # POST /phones
  def create
    @contact.phones << Phone.new(phone_params)

    if @contact.save
      render json: @contact.phones, status: :created, location: contact_phones_url(@contact)
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /phones/1
  def update
    if @phone.update(phone_params)
      render json: @phone
    else
      render json: @phone.errors, status: :unprocessable_entity
    end
  end

  # DELETE /phones/1
  def destroy
    @contact.phone.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:contact_id])
    end

    # Only allow a trusted parameter "white list" through.
    def phone_params
      # params.require(:phone).permit(:number, :contact_id)
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
