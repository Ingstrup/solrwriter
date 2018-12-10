class SolrInput
  require 'record'
  include SAXMachine
  elements :record, as: :records, class: Record
end
