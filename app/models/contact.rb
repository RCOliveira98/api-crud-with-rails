class Contact < ApplicationRecord
  belongs_to :kind, optional: true
end
