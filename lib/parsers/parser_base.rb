class ParserBase
  attr_reader :data

  def parseable?
    false
  end

  def parse
    commits.each { |c| parse_commit(c) }
  end

  def parse_commit(commit)
  end

  protected
    def commits
      @commits ||= data['commits']
    end

    def find_user(email, name)
      User.find_by_email(email) || User.find_by_name(name)
    end
end



