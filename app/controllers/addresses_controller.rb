class AddressesController < ApplicationController
    before_action :set_contact, only: [:create, :show, :update, :destroy]
  
    # GET /addresses
    def index
      @addresses = Address.all
  
      render json: @addresses
    end
  
    # GET /addresses/1
    def show
      render json: @contact.address
    end
  
    # POST /addresses
    def create

      @contact.address = Address.new(address_params)
  
      if @contact.save
        render json: @contact.address, status: :created, location: contact_address_url(@contact)
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /addresses/1
    def update
      if @contact.address.update(address_params)
        render json: @contact.address
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /addresses/1
    def destroy
      @contact.address.destroy
    end
  
    private
      def set_contact
        @contact = Contact.find(params[:contact_id])
      end
  
      def address_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
        # params.require(:address).permit(:name, :email, :birthdate, :kind_id, 
        #  phones_attributes: [:number, :id, :_destroy],
        # address_attributes: [:id, :street, :city])
      end
  end
  