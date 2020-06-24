module V2
  class ContactsController < ApplicationController
    before_action :set_contact, only: [:show, :update, :destroy]
  
    # GET /contacts
    def index
      @contacts = Contact.all.sample(10)
  
      render json: @contacts, include: :kind
    end
  
    # GET /contacts/1
    def show
      render json: @contact, include: :kind
    end
  
    # POST /contacts
    def create
      @contact = Contact.new(contact_params)
  
      if @contact.save
        render json: @contact, include: :kind, status: :created, location: @contact
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /contacts/1
    def update
      if @contact.update(contact_params)
        render json: @contact, include: :kind
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /contacts/1
    def destroy
      @contact.destroy
    end
  
    private
      def set_contact
        @contact = Contact.find(params[:id])
      end
  
      def contact_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
        # params.require(:contact).permit(:name, :email, :birthdate, :kind_id, 
        #  phones_attributes: [:number, :id, :_destroy],
        # address_attributes: [:id, :street, :city])
      end
  end
  
end