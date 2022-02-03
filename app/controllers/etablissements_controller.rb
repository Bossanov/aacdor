class EtablissementsController < ApplicationController

  def new
    @etablissement = Etablissement.new
  end
  def create
    @etablissement = Etablissement.new(etablissement_params)

    if @etablissement.save
      flash[:notice] = "L'établissement a été créé."
      redirect_to root_path
    else
      flash[:notice] = 'Oups nous avons un problème'
      redirect_to root_path
    end
  end
  def edit
    @etablissement = Etablissement.find_by_id(params[:id])
  end
  def update
     @etablissement = Etablissement.find_by_id(params[:id])
     @etablissement.address = @etablissement.rue + " " + @etablissement.codepostal + " " + @etablissement.ville

     gps = Geocoder.coordinates(@etablissement.address)
     if gps.nil?
     else
     @etablissement.latitude = gps[0]
     @etablissement.longitude = gps[1]
     end
    if @etablissement.update(etablissement_params)
      redirect_to etablissement_path(@etablissement)

      @etablissement.update(etablissement_params)
      flash[:notice] = 'La saisie a correctement été actualisée.'

    else
      flash[:notice] = 'Oups nous avons un problème'
      redirect_to etablissement_path(@etablissement)
    end
  end
  def index
    @etablissements = Etablissement.all.order(:nom)
    @markerseta = @etablissements.geocoded.map do |adh|
      {
        lat: adh.latitude,
        lng: adh.longitude,
        info_window: render_to_string(partial: "info_window", locals: { etablissement: adh })
      }
    end
  end
  def show
    @etablissement = Etablissement.where(id: params[:id])
    @markereta = @etablissement.geocoded.map do |adh|
      {
        lat: adh.latitude,
        lng: adh.longitude,
        info_window: render_to_string(partial: "info_window", locals: { etablissement: adh })
      }
    end
  end

  def effacer_etablissement
    @etablissement = Etablissement.find(params[:adherentid])
    @etablissement.destroy
    redirect_to etablissements_path
  end


  private

  def etablissement_params
    params.require(:etablissement).permit(:rue, :codepostal, :ville, :departement, :nom, :address, :typeeta, :siret, :pcr_id, :telephone, :email, :statut, :complementrue, :medecin_id)
  end

end

