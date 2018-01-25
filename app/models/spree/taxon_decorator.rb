Spree::Taxon.class_eval do
  include AlgoliaSearch

  algoliasearch index_name: 'athtaxon' do
    attribute :name, :foto, :taxon_url, :meta_keywords
  end
  def foto
    icon.try(:attachment, :normal).to_s
  end
  def taxon_url
    '/t/'+permalink
  end
end
