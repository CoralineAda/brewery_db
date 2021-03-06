require 'spec_helper'

describe BreweryDB::Client do
  subject(:client) { described_class.new }

  context '#config' do
    it 'returns a configuration instance' do
      expect(client.config).to be_a(BreweryDB::Config)
    end

    it 'memoizes the return value' do
      expect(BreweryDB::Config).to receive(:new).once.and_return(double)
      2.times { client.config }
    end
  end

  context '#configure' do
    it 'can set the adapter' do
      expect {
        client.configure { |config| config.adapter = :typhoeus }
      }.to change(client.config, :adapter).to(:typhoeus)
    end

    it 'can set the API key' do
      expect {
        client.configure { |config| config.api_key = 'secret' }
      }.to change(client.config, :api_key).to('secret')
    end

    it 'can set the base URI' do
      expect {
        client.configure { |config| config.base_uri = 'http://example.com' }
      }.to change(client.config, :base_uri).to('http://example.com')
    end

    it 'can set the timeout' do
      expect {
        client.configure { |config| config.timeout = 42 }
      }.to change(client.config, :timeout).to(42)
    end

    it 'can set the user agent' do
      expect {
        client.configure { |config| config.user_agent = 'Brewdega' }
      }.to change(client.config, :user_agent).to('Brewdega')
    end
  end

  it { expect(client.beers).to be_a(BreweryDB::Resources::Beers) }

  it { expect(client.breweries).to be_a(BreweryDB::Resources::Breweries) }

  it { expect(client.categories).to be_a(BreweryDB::Resources::Categories) }

  it { expect(client.fermentables).to be_a(BreweryDB::Resources::Fermentables) }

  it { expect(client.fluid_size).to be_a(BreweryDB::Resources::FluidSize) }

  it { expect(client.glassware).to be_a(BreweryDB::Resources::Glassware) }

  it { expect(client.hops).to be_a(BreweryDB::Resources::Hops) }

  it { expect(client.locations).to be_a(BreweryDB::Resources::Locations) }

  it { expect(client.menu).to be_a(BreweryDB::Resources::Menu) }

  it { expect(client.search).to be_a(BreweryDB::Resources::Search) }

  it { expect(client.styles).to be_a(BreweryDB::Resources::Styles) }

  it { expect(client.yeasts).to be_a(BreweryDB::Resources::Yeasts) }

  it { expect(client.brewery('KlSsWY')).to be_a(BreweryDB::Resources::Brewery) }
end
