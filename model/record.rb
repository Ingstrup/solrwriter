class Record
  include SAXMachine
  require 'model/header'
  require 'model/metadata'
  element :header, class: Header
  element :metadata, class: Metadata
end

