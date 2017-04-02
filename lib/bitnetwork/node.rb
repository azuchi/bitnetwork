require 'socket'

module Bitnetwork

  class Node


    attr_reader :addr_info


    def initialize(node_name)
      @node_name = node_name
      puts Socket.getaddrinfo(node_name, nil, Socket::Constants::AF_INET)
    end

  end

end
