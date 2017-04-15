require 'socket'

module Bitnetwork

  class Node

    attr_reader :addr_info

    def initialize(data)
      @addr_info = Addrinfo.new(data[3], data[0], data[5], data[6])
    end

    def addr
      addr_info.ip_address
    end

  end

end
