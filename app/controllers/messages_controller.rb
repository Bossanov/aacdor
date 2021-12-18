class MessagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @message = Message.new

  end


  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = 'Votre demande a été envoyée, merci !'
      redirect_to root_path
    else
      redirect_to root_path
      flash[:notice] = 'Une erreur est survenue, veuillez recommencer ...'
    end
  end

  def index

    @messages = Message.all

  end

  def destroy
    @message = Message.find(params[:messageid])
    @message.destroy
    redirect_to pages_admin_path

  end

  def effacer_message
    @message = Message.find(params[:messageid])
    @message.destroy
    redirect_to pages_admin_path
  end
  private

  def message_params
    params.require(:message).permit(:nom, :prenom, :adresse, :email, :telephone, :content)
  end
end
