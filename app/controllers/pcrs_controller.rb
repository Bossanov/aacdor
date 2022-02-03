class PcrsController < ApplicationController

  def new
    @pcr = Pcr.new
  end
  def create
    @pcr = Pcr.new(pcr_params)
    #num = Pcr.all.count + 1
    #@pcr.id = num
    if @pcr.user_id.nil?

      user = User.create!(
              email: @pcr.email,
              password: @pcr.email,
              statut: "pcr"
        )
      user.save
      @pcr.user_id = user.id

    end
    if @pcr.save
      flash[:notice] = "Le CRP a été créé."
      redirect_to pcrs_path
    else
      flash[:notice] = 'Oups nous avons un problème'
      redirect_to pcrs_path
    end
  end
  def edit
    @pcr = Pcr.find_by_id(params[:id])
  end
  def update
     @pcr = Pcr.find_by_id(params[:id])



    if @pcr.update(pcr_params)
      flash[:notice] = 'La saisie a correctement été actualisée.'
      redirect_to pcrs_path



    else
      flash[:notice] = 'Oups nous avons un problème'
      redirect_to pcrs_path
    end
  end

  def index
    @pcrs = Pcr.all.order(:nom)
  end

  def show
    @pcr = Pcr.where(id: params[:id])

  end

  def effacer_pcr
    @pcr = Pcr.find(params[:pcrid])
    @pcr.destroy
    redirect_to pcrs_path
  end


  private

  def pcr_params
    params.require(:pcr).permit(:rue, :codepostal, :ville, :nom, :prenom,  :telephone, :email, :datenaissance, :statut, :content )
  end

end
