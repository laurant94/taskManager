class LabelsController < ApplicationController
  before_action :set_label, only: [:show, :edit, :update, :destroy]

  def index
    @labels = current_user.labels
  end

  def new
    @label = Label.new
  end

  def create
    @label = Label.new(get_params)
    @label.user = current_user
    if @label.save
      redirect_to labels_path
    else
      render 'new', danger: "Error"
    end
  end

  def edit
  end

  def update
    @label.update_attributes(get_params)
    if @labels.save
      redirect_to labels_path
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @label.destroy
  end

  private
  def set_label
    @label = Label.find(params[:id])
  end

  def get_params
    params.require(:label).permit(:name)
  end
end
