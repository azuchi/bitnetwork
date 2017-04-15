require 'socket'
require 'ipaddr'
require 'open-uri'
module Bitnetwork

  class Crawler

    attr_reader :config

    def initialize(config)
      @config = config['bitnetwork']
    end

    def network_port
      config['network'] == 'mainnet' ? 8333 : 18333
    end

    def run
      processed = []
      config['dns_seeds'].each do |seed|
        Socket.getaddrinfo(seed, nil, Socket::Constants::AF_INET).each do |result|
          node = Bitnetwork::Node.new(result)
          next if processed.include?(node.addr)
          conn = Bitnetwork::Connection.new(node.addr, config)
          conn.open
          processed << node.addr
          puts "######### addrinfo #########"
          puts node.addr_info.to_s
        end
      end
      puts exclude_lists
    end

    private

    # get exclude ip lists. this is bogon list.
    def exclude_lists
      return @exclude_ips if @exclude_ips && !@exclude_ips.empty?
      @exclude_ips = []
      open('http://www.team-cymru.org/Services/Bogons/fullbogons-ipv4.txt') do |f|
        f.each_line do |l|
          @exclude_ips << l.chomp if IPAddr.new(l.chomp).ipv4? rescue false
        end
      end
    end

  end
end