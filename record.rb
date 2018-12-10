class Record
  include SAXMachine
  require 'header'
  require 'metadata'
  element :header, class: Header
  element :metadata, class: Metadata
end

