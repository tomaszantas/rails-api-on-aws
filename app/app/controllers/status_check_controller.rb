class StatusCheckController < ApplicationController
  def index
    render json: {
      message: "hello"
    }.to_json
  end
end
