class MaterielsController < ApplicationController

  def new
    @materiel = Materiel.new
  end
  def create
    @materiel = Materiel.new(materiel_params)

    if @materiel.save
      flash[:notice] = "Le nouveau matériel a été créé."
      redirect_to materiels_path
    else
      flash[:notice] = 'Oups nous avons un problème'
      redirect_to materiels_path
    end
  end
  def edit
    @materiel = Materiel.find_by_id(params[:id])
  end
  def update
     @materiel = Materiel.find_by_id(params[:id])



    if @materiel.update(materiel_params)
      flash[:notice] = 'La saisie a correctement été actualisée.'
      redirect_to materiel_path(@materiel)



    else
      flash[:notice] = 'Oups nous avons un problème'
      redirect_to materiel_path(@materiel)
    end
  end

  def index
    @materiels = Materiel.all.order(:nom)
  end

  def show
    @materiel = Materiel.where(id: params[:id])

  end

  def effacer_materiel
    @materiel = Materiel.find(params[:medecinid])
    @materiel.destroy
    redirect_to materiels_path
  end


  private

  def materiel_params
    params.require(:materiel).permit(:etablissement_id, :statut, :typemat, :marque, :modele, :numserie, :anfab, :anmes, :empla, :numasn, :datasn, :numsigis, :tensionmax, :intensitemax, :tempsmoyen, :capteurbase_id, :mesorgagree )
  end

end
