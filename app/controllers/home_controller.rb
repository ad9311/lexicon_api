class HomeController < ApplicationController
  def index
    @langs = Language.all.sort_by(&:name)
    @dicts = Dictionary.all.sort_by(&:name)
  end
end
