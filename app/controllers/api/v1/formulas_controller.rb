class Api::V1::FormulasController < ApplicationController
  def index
    formula = Formula.all.order(created_at: :desc)
    render json: formula
  end

  def create
    formula = Formula.create!(formula_params)
    if formula
      render json: formula
    else
      render json: formula.errors
    end
  end

  def show
    if formula
      render json: formula
    else
      render json: formula.errors
    end
  end

  def destroy
    formula&.destroy
    render json: { message: 'Recipe deleted!' }
  end

  private

  def formula_params
    params.permit(:name, :image, :ingredients, :instruction)
  end

  def formula
    @formula ||= Formula.find(params[:id])
  end
end
