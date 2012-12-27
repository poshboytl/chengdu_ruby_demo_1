class BitbucketParser < ParserBase
  def initialize(data)
    @data = data
  end

  def parse_commit(commit)
    author_name, author_email = commit['raw_author'].scan(/(.+) <([^<>]+)>/).flatten
    if user = find_user(author_email, author_name)
      user.commits.create(message: commit['message'],
        revision: commit['raw_node'])
    end
  end

  def parseable?
    data.try('[]', 'canon_url').try(:include?, 'bitbucket.org')
  end
end