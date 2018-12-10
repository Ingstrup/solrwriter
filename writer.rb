class Writer
  require 'rsolr'

  def initialize(feeds)
    @feeds=feeds
  end

  def write

    solr = RSolr.connect :url => 'http://localhost:8983/solr/libguides'

    byebug

    documents = [{:id=>4, :title => 'one'}, {:id=>3, :title => 'two'}]
    solr.add documents, :add_attributes => {:commitWithin => 10}
  end

end
