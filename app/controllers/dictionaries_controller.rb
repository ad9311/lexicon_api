class DictionariesController < ApplicationController
  before_action :set_dictionary, only: %i[show edit update destroy]

  def show
    @entries = @dict.entries.sort_by(&:classif)
  end

  def new
    @dict = Dictionary.new
    @lang_select = Language.all.sort_by(&:name).pluck(:name, :id).each { |arr| arr[0].capitalize! }
    @submit = 'Add'
  end

  def create
    @dict = Dictionary.new dictionary_params
    @dict.save

    redirect_to root_path
  end

  def edit
    @submit = 'Edit'
  end

  def update
    @dict.update dictionary_params

    redirect_to root_path
  end

  def destroy; end

  private

  def set_dictionary
    @dict = Dictionary.find params[:id]
  end

  def dictionary_params
    raw_params = params.require(:dictionary).permit(:source_id, :target_id)
    @source = Language.find(raw_params[:source_id])
    @target = Language.find(raw_params[:target_id])
    @name = "#{@source.name}-#{@target.name}"
    raw_params[:name] = @name
    raw_params
  end
end
