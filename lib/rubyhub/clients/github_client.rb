# Client class for github
#
# @since 0.1.0
class RubyHub::GithubClient
  class NoSearchTermError < StandardError; end
  def initialize
    @client = Octokit::Client.new
  end

  # Search repositries on remote target
  #
  # @since 0.1.0
  # @param [String] search query
  # @raise [NoSearchTermError] raise if empty search term passed
  # @return [Array]
  def search(query)
    raise NoSearchTermError if query.empty? 
    @client.search_repos(query).items
  end

  # Encapculate response which differs for each sdk, api
  # 
  # @since 0.1.0
  # @param [Hash] repository response hash
  # @return [Hash]
  def mapping(repo)
    {
      name:  repo[:name],
      owner: repo[:owner][:login],
      url:   repo[:svn_url]
    }
  end
end
