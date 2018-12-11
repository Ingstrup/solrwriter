class RecordListWrapper
  require 'model/record'
  include SAXMachine
  elements :record, as: :records, class: Record
end
