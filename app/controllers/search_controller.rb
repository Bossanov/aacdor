class SearchController < ApplicationController
  def run
    @results = Elasticsearch::Model.search(params[:q]).records

  end
end
