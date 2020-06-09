class AddressesController < ApplicationController
    before_action :set_address, only: [:show, :update, :destroy]
  
    # GET /addresses
    def index
      @addresses = Address.all
  
      render json: @addresses
    end
  
    # GET /addresses/1
    def show
      render json: @address
    end
  
    # POST /addresses
    def create
      @address = Address.new(address_params)
  
      if @address.save
        render json: @address, status: :created, location: @address
      else
        render json: @address.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /addresses/1
    def update
      if @address.update(address_params)
        render json: @address
      else
        render json: @address.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /addresses/1
    def destroy
      @address.destroy
    end
  
    private
      def set_address
        @address = params[:contact_id] ? Contact.find(params[:contact_id]).address : Address.find(params[:id])
      end
  
      def address_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
        # params.require(:address).permit(:name, :email, :birthdate, :kind_id, 
        #  phones_attributes: [:number, :id, :_destroy],
        # address_attributes: [:id, :street, :city])
      end
  end
  