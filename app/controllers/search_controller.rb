class SearchController < ApplicationController

def result
    @q = Adherent.ransack(params[:q])
    @items = @q.result
  end


end
