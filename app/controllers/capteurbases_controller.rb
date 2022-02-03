class CapteurbasesController < ApplicationController

  def new
    @capteurbase = Capteurbase.new
  end

  def create
    @capteurbase = Capteurbase.new(capteurbase_params)
    if @capteurbase.save
      flash[:notice] = 'Le nouveau capteur a été créé!'
      redirect_to pages_admin_path
    else
      redirect_to pages_admin_path
      flash[:notice] = 'Une erreur est survenue, veuillez recommencer ...'
    end
  end

  def index
    @capteurbases = Capteurbase.all
  end

  def edit
    @capteurbase = Capteurbase.find_by_id(params[:id])
  end

  def update
     @capteurbase = Capteurbase.find_by_id(params[:id])
    if @capteurbase.update(capteurbase_params)
      flash[:notice] = 'La saisie a correctement été actualisée.'
      redirect_to pages_admin_path
    else
      flash[:notice] = 'Oups nous avons un problème'
      redirect_to pages_admin_path
    end
  end

  def effacer_capteurbase
    @capteurbase = Capteurbase.find(params[:capteurbaseid])
    @capteurbase.destroy
    redirect_to pages_admin_path
  end

  private

  def capteurbase_params
    params.require(:capteurbase).permit(:marque, :modele, :typecap)
  end

end
