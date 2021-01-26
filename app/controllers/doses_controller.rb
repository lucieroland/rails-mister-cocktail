class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail_id)
    else
      render
    end
  end


  def destroy
    # @cocktail = Cocktail.find(params[:cocktail_id])
    # @dose.cocktail = @cocktail
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail_id)
  end
  private
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end








