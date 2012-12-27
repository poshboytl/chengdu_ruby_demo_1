class CommitService
  SUPPORT_SERVICE = [BitbucketParser]
  attr_reader :data

  def initialize(hook_params)
    @data = JSON.parse hook_params['payload'] if hook_params['payload']
  end

  def parseable?
    !@data.nil?
  end

  def parse
    SUPPORT_SERVICE.each do |service|
      parser = service.new(data)
      if parser.parseable?
        parser.parse
        return
      end
    end
  end

end