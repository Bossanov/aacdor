class AdherentsController < ApplicationController

  def new
    @adherent = Adherent.new
  end

  def create
    @adherent = Adherent.new(adherent_params)
    num = Adherent.all.count + 1
    @adherent.id = num
    if @adherent.user_id.nil?

      user = User.create!(
              email: @adherent.email,
              password: @adherent.numsecu,
              statut: "adherent"
        )
      user.save
      @pcr.user_id = user.id

    end
    @etablissement = Etablissement.where(nom: params[:adherent][:etablissement])
    if @etablissement.nil?
      flash[:notice] = "Vous devez créer creer ou associer un établissement à l'adhérent."
      redirect_to etablissements_path
    end
    @adherent.etablissement_id = @etablissement.last.id
    if @adherent.save
      flash[:notice] = "L'adhérent a été créé."
      redirect_to root_path
    else
      flash[:notice] = 'Oups nous avons un problème'
      redirect_to root_path
    end
  end

  def edit
    @adherent = Adherent.find_by_id(params[:id])
  end

  def update
     @adherent = Adherent.find_by_id(params[:id])
     @adherent.address = @adherent.rue + " " + @adherent.codepostal + " " + @adherent.ville

     gps = Geocoder.coordinates(@adherent.address)
     if gps.nil?
     else
     @adherent.latitude = gps[0]
     @adherent.longitude = gps[1]

     end
    @etablissement = Etablissement.where(nom: params[:adherent][:etablissement])
    if @etablissement.nil?
      flash[:notice] = "Vous devez créer creer ou associer un établissement à l'adhérent."
      redirect_to etablissements_path
    end
    @adherent.etablissement_id = @etablissement.last.id
    if @adherent.update(adherent_params)
      redirect_to adherent_path(@adherent)

      @adherent.update(adherent_params)
      flash[:notice] = 'La saisie a correctement été actualisée.'

    else
      flash[:notice] = 'Oups nous avons un problème'
      redirect_to adherent_path(@adherent)
    end
  end

  def index
    @adherents = Adherent.all.order(:nom)
    @markers = @adherents.geocoded.map do |adh|
      {
        lat: adh.latitude,
        lng: adh.longitude,
        info_window: render_to_string(partial: "info_window", locals: { adherent: adh })
      }
    end
  end

  def show
    @adherent = Adherent.where(id: params[:id])
    @marker = @adherent.geocoded.map do |adh|
      {
        lat: adh.latitude,
        lng: adh.longitude,
        info_window: render_to_string(partial: "info_window", locals: { adherent: adh })
      }
    end
  end

  def effacer_adherent
    @adherent = Adherent.find(params[:adherentid])
    @adherent.destroy
    redirect_to adherents_path
  end

  def retirer_pcr
    @adherent = Adherent.find(params[:adherentid])
    @adherent.pcr = ""
    @adherent.save
    redirect_to pages_pcr_path
  end

  private

  def adherent_params
    params.require(:adherent).permit(:rue, :codepostal, :ville, :departement, :nom, :prenom, :siret, :emploi, :tauxhorairesemaine, :naissance, :sexe, :telephone, :numsecu, :respactnucleaire, :address, :detailadresse, :email , :pcr, :etablissement)
  end

end
