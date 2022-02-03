class MedecinsController < ApplicationController

  def new
    @medecin = Medecin.new
  end
  def create
    @medecin = Medecin.new(medecin_params)

    if @medecin.save
      flash[:notice] = "Le nouveau médecin du travail a été créé."
      redirect_to medecins_path
    else
      flash[:notice] = 'Oups nous avons un problème'
      redirect_to medecins_path
    end
  end
  def edit
    @medecin = Medecin.find_by_id(params[:id])
  end
  def update
     @medecin = Medecin.find_by_id(params[:id])



    if @medecin.update(medecin_params)
      flash[:notice] = 'La saisie a correctement été actualisée.'
      redirect_to medecin_path(@medecin)



    else
      flash[:notice] = 'Oups nous avons un problème'
      redirect_to medecin_path(@medecin)
    end
  end

  def index
    @medecins = Medecin.all.order(:nom)
  end

  def show
    @medecin = Medecin.where(id: params[:id])

  end

  def effacer_medecin
    @medecin = Medecin.find(params[:medecinid])
    @medecin.destroy
    redirect_to medecins_path
  end


  private

  def medecin_params
    params.require(:medecin).permit(:rue, :codepostal, :ville, :complementrue, :nom, :prenom, :sexe,:rpps, :nometa,  :telephone, :email, :siret, :siseri )
  end

end
