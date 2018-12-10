class Metadata
  include SAXMachine
  element "dc:title",       as: :title
  element "dc:creator",     as: :creator
  element "dc:subject",     as: :subject
  element "dc:type",        as: :type
  element "dc:description", as: :description
  element "dc:publisher",   as: :publisher
  element "dc:date",        as: :date
  element "dc:identifier",  as: :identifier
end
