local_dir = File.expand_path('../', __FILE__)
$LOAD_PATH.unshift(local_dir)

class Reader
  require 'sax-machine'
  include SAXMachine
  require 'open-uri' # for nokogiri open-method
  require 'nokogiri'
  require 'model/record_list_wrapper'
  require 'yaml'

  SAXMachine.handler = :nokogiri

  def read
    config = YAML.load_file('config.yml')
    url1 = config['docs']['az']
    url2 = config['docs']['guides']
    doc1 = Nokogiri::XML(open(url1))
    doc2 = Nokogiri::XML(open(url2))

    # return array of feeds
    [RecordListWrapper.new.parse(doc1.to_xml), RecordListWrapper.new.parse(doc2.to_xml)]
  end
end

