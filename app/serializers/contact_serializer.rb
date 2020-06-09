class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  belongs_to :kind do
    link(:related) { contact_kind_url(object.id)}
  end
  has_many :phones do
    link(:related) { contact_phones_url(object.id)}
  end
  has_one :address do
    link(:related) { contact_address_url(object.id) }
  end

  # add links
  # link(:self) { contact_url(object.id) }
  # link(:kind) { kind_url(object.kind.id)}

  def attributes(*args)
    contact = super(*args)
    # pt-BR ---> contact[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    contact[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    contact # return
  end

end
