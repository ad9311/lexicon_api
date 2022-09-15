class EntriesController < ApplicationController
  before_action :set_entry, only: %i[edit update destroy]
  before_action :set_dictionary, only: %i[new]
  before_action :set_enums, only: %i[new edit]

  def new
    @entry = Entry.new
    @submit = 'Add'
  end

  def create
    @entry = Entry.new entry_params
    @entry.save
    @dict = @entry.dictionary

    redirect_to new_entry_path(dictionary_id: @dict.id)
  end

  def edit
    @dict = @entry.dictionary
    @submit = 'Edit'
  end

  def update
    @entry.update entry_params

    redirect_to dictionary_path @entry.dictionary
  end

  def destroy
    @dict = @entry.dictionary
    @entry.destroy

    redirect_to dictionary_path(@dict)
  end

  private

  def set_entry
    @entry = Entry.find params[:id]
  end

  def set_dictionary
    @dict = Dictionary.find params[:dictionary_id]
  end

  def set_enums
    @genders = Entry.genders
    @classifs = Entry.classifs
  end

  def entry_params
    raw_params = params.require(:entry).permit(:source, :target, :classif, :gender, :dictionary_id)
    raw_params.each_pair do |k, v|
      raw_params[k] = v.downcase if %w[source target].include? k
    end
  end
end
