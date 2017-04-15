module Bitnetwork
  class Connection

    attr_reader :to_addr, :config
    attr_accessor :socket

    def initialize(to_addr, config)
      @to_addr = to_addr
      @config = config
    end

    # open connection
    def open

    end

    # close connection
    def close

    end

    def handshake

    end

    def get_addr

    end

  end
end