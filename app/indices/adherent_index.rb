class AdherentIndex
  include SearchFlip::Index

  def self.index_name
    "adherents"
  end

  def self.model
    Adherent
  end

  def self.serialize(adherent)
    {
      id: adherent.id,
      nom: adherent.nom,
      prenom: adherent.prenom,

      ville: adherent.ville,

      etablissement: adherent.etablissement
    }
  end
end
