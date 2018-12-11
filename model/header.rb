class Header
  include SAXMachine
  element :identifier
  element :datestamp
  element :setSpec, as: :set_spec
end
