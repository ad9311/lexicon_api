class LanguagesController < ApplicationController
  before_action :set_language, only: %i[edit update destroy]

  def new
    @lang = Language.new
    @submit = 'Add'
  end

  def create
    @lang = Language.new language_params
    @lang.save

    redirect_to root_path
  end

  def edit
    @submit = 'Edit'
  end

  def update
    @lang.update language_params

    redirect_to root_path
  end

  def destroy; end

  private

  def set_language
    @lang = Language.find params[:id]
  end

  def language_params
    raw_params = params.require(:language).permit(:name, :abbrev)
    raw_params.each_value { |param| param.downcase! if param.is_a? String }
  end
end
