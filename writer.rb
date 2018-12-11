class Writer
  require 'rsolr'

  def initialize(feeds)
    @feeds=feeds
  end

  def write
    solr = RSolr.connect :url => 'http://localhost:8983/solr/libguides'
    documents = @feeds.map do |feed|
      feed.records.map do |record|
        {          id: record.header.identifier,
                title: record.metadata.title,
          description: record.metadata.description,
                 date: record.metadata.date.gsub(" ", "T").concat("Z"),
             set_spec: record.header.set_spec
        }
      end
    end.flatten
    solr.add documents, :add_attributes => {:commitWithin => 10}
  end
end

