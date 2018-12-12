class Writer
  require 'rsolr'

  def initialize(feeds)
    @feeds=feeds
  end

  def write
    config = YAML.load_file('config.yml')
    solr = RSolr.connect :url => config['solr_url']
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

