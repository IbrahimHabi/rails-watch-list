# frozen_string_literal: true

class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show; end

  def edit; end

  def create
    @list = List.create(list_params)
    if @list.save
      redirect_to @list
    else
      render 'new'
    end
  end

  # def create
  #   list = List.new(list_params)
  #   list.save
  #   redirect_to lists_path
  # end

  # def edit
  # end

  # def update
  #   @list.update(list_params)
  #   redirect_to list_path(@list)
  # end

  # def destroy
  #   @list.destroy
  #   redirect_to lists_path
  # end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
