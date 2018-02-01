Spree::Product.class_eval do
  include AlgoliaSearch

  algoliasearch index_name: 'athspree' do
    attribute :name, :sku
    attribute :foto, :product_url
  end
  def foto
    master.images.first.nil? ? "/assets/noimage/small.png": master.images.first.attachment.url(:small)
  end
  def product_url
    Spree::Core::Engine.routes.url_helpers.product_path(self)
  end
end
