class RubyHub::GitRepositories
  # Intialize client
  # Client interface should be satisfied
  #
  # @since 0.1.0
  # @param [ClientInterface]
  # @return self
  def initialize(client)
    @client = client
  end

  # Get repository from db, external service, inmem db
  # 
  # @since 0.1.0
  # @param [String] value to search
  # @return [Array<RubyHub::Repository>]
  def find(query)
    results = client.search(query)
    results.map{|result| RubyHub::Repository.new(client.mapping(result))}
  end

  private
  attr_reader :client
end
