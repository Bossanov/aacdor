class SearchController < ApplicationController
  def search
    query = AdherentIndex.search(params[:title].to_s)

    @results = query.records
    @total_results = query.total_entries

  end
end
