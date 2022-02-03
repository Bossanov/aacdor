class GenerateurbasesController < ApplicationController

  def new
    @generateurbase = Generateurbase.new
  end

  def create
    @generateurbase = Generateurbase.new(generateurbase_params)
    if @generateurbase.save
      flash[:notice] = 'Le nouveau générateur a été créé!'
      redirect_to pages_admin_path
    else
      redirect_to pages_admin_path
      flash[:notice] = 'Une erreur est survenue, veuillez recommencer ...'
    end
  end

  def index
    @generateurbases = Generateurbase.all
  end

  def edit
    @generateurbase = Generateurbase.find_by_id(params[:id])
  end

  def update
     @generateurbase = Generateurbase.find_by_id(params[:id])
    if @generateurbase.update(generateurbase_params)
      flash[:notice] = 'La saisie a correctement été actualisée.'
      redirect_to pages_admin_path
    else
      flash[:notice] = 'Oups nous avons un problème'
      redirect_to pages_admin_path
    end
  end

  def effacer_generateurbase
    @generateurbase = Generateurbase.find(params[:generateurbaseid])
    @generateurbase.destroy
    redirect_to pages_admin_path
  end

  private

  def generateurbase_params
    params.require(:generateurbase).permit(:marque, :modele, :typegen)
  end

end
