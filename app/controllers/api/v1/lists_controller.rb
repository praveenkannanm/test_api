class Api::V1::ListsController < ApplicationController
  before_action :authorize_user, only: [:create]
  before_action :set_list, only: [:update, :destroy, :assing_member]

  def index
    render json: @current_user.user_lists(params)
  end

  def create
    list = @current_user.owned_lists.build(list_params)
    if list.save
      render json: { data: list }, status: :ok
    else
      render json: { error: list.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @list.update(list_params)
      render json: { data: @list }, status: :ok
    else
      render json: { error: @list.errors }, status: :unprocessable_entity
    end
  end

  def show

  end

  def destroy
    @list.destroy
  end

  def assing_member
    assigne = User.find params[:user_id]
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end

  def authorize_user
    render_unauthorized unless @current_user.admin?
  end

  def set_list
    @list = @current_user.owned_lists.find params[:id]
  end

end
