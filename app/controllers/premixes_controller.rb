class PremixesController < ApplicationController

  def show
    fetch_premix
  end

  def new
    fetch_premix
    @premix.set_premix_ingredients
    render :edit
  end

  def edit
    fetch_premix
  end

  def update
    fetch_premix
    if @premix.update(premix_params)
      flash[:success] = "Premix updated successfully."
      redirect_to edit_premix_path(@premix)
      session[:should_reset_premix?] = false
    else
      flash[:danger] = "Ooppps, fail to update Premix."
      render :edit
    end
  end

private

  def fetch_premix
    @premix = current_user.premixes.find params[:id]
  end

  def premix_params
    params.require(:premix).
      permit(:target_bag_weight, :bags_of_premix, :usage_bags, 
        premix_ingredients_attributes: [:id, :ingredient_id, :actual_usage, :premix_usage])
  end
end
