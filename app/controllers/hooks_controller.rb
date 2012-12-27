class HooksController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    service = CommitService.new(params)
    if service.parseable?
      service.parse
      render nothing: true, status: 200
    else
      render nothing: true, status: 403
    end
  end
end











