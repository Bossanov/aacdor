class PersonnelsController < ApplicationController

  def new
    @personnel = Personnel.new
  end
  def create
    @personnel = Personnel.new(personnel_params)

    if @personnel.save
      flash[:notice] = "Le nouveau personnel a été créé."
      redirect_to personnels_path
    else
      flash[:notice] = 'Oups nous avons un problème'
      redirect_to personnels_path
    end
  end
  def edit
    @personnel = Personnel.find_by_id(params[:id])
  end
  def update
     @personnel = Personnel.find_by_id(params[:id])



    if @personnel.update(personnel_params)
      flash[:notice] = 'La saisie a correctement été actualisée.'
      redirect_to personnel_path(@personnel)



    else
      flash[:notice] = 'Oups nous avons un problème'
      redirect_to personnel_path(@personnel)
    end
  end

  def index
    @personnels = Personnel.all.order(:nom)
  end

  def show
    @personnel = Personnel.where(id: params[:id])

  end

  def effacer_personnel
    @personnel = Personnel.find(params[:medecinid])
    @personnel.destroy
    redirect_to personnels_path
  end


  private

  def personnel_params
    params.require(:personnel).permit(:rue, :codepostal, :ville, :nom, :prenom, :sexe, :numsecu, :telephone, :email, :emploi, :statut, :etablissement_id, :radiocomp, :datenaissance )
  end

end

