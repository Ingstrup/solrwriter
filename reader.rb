local_dir = File.expand_path('../', __FILE__)
$LOAD_PATH.unshift(local_dir)

class Reader

require 'sax-machine'
include SAXMachine
require 'open-uri' # for nokogiri open-method
require 'nokogiri'
require 'solr_input'
require 'writer'
require 'byebug'

SAXMachine.handler = :nokogiri

  def read
    url1 = 'http://libguides.dtu.dk/oai.php?verb=ListRecords&metadataPrefix=oai_dc&set=az'
    url2 = 'http://libguides.dtu.dk/oai.php?verb=ListRecords&metadataPrefix=oai_dc&set=guides'
    doc1 = Nokogiri::XML(open(url1))
    doc2 = Nokogiri::XML(open(url2))

    # return array of feeds
    [SolrInput.new.parse(doc1.to_xml), SolrInput.new.parse(doc2.to_xml)]
  end
end

