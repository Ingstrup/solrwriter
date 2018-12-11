class Writer
  require 'rsolr'

  def initialize(feeds)
    @feeds=feeds
  end

  def write
    solr = RSolr.connect :url => 'http://localhost:8983/solr/libguides'
    documents = @feeds.map do |feed|
      feed.records.map do |record|
        m = record.metadata
        h = record.header
        {          id: h.identifier,
                title: m.title,
          description: m.description,
            publisher: m.publisher,
                 link: m.identifier,
                 date: m.date.gsub(" ", "T").concat("Z"),
             set_spec: h.set_spec
        }
      end
    end.flatten
    solr.add documents, :add_attributes => {:commitWithin => 10}
  end
end

