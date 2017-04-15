require 'spec_helper'

describe Bitnetwork::Crawler do

  it 'crawler' do
    config = YAML.load_file(File.expand_path('../../../bitnetwork.yml', __FILE__))
    crawler = Bitnetwork::Crawler.new(config)
    crawler.run
  end

end