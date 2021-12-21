User.destroy_all
Adherent.destroy_all
Etablissement.destroy_all
Pcr.destroy_all


puts "Création du CRP"
userpcr = User.create!(
        email: "staumont.michel@icloud.com",
        password: "Bossanova1",
        statut: "pcr"
      )
userpcr.save
pcr = Pcr.create!(
        nom: "STAUMONT",
        prenom: "Michel",
        rue: "25 rue du cateau",
        codepostal: "59550",
        ville: "Fontaine au bois",
        departement: "Nord",
        telephone: "0661526441",
        email: userpcr.email,
        user_id: userpcr.id
      )
pcr.save


xls_file = Roo::Excelx.new('db/adherent.xlsx')
s = Roo::CSV.new("db/adherent.csv")
xls_file.to_csv("db/adherent.csv")
l = 1
CSV.foreach("db/adherent.csv") do |row|
    eta = Etablissement.all.count + 1
    num = Adherent.all.count + 1
    puts row[2]
    puts "1 vérification établissement"

    etaunique = Etablissement.where(nom: row[1])

    if etaunique.length == 0
      puts "1.2 création nouvel établissement"

    if row[4].nil? || row[5].nil? || row[6].nil?

    etablissement = Etablissement.create!(
      id: eta,
      nom: row[1],
      rue:"NC",
      codepostal:"NC",
      ville:"NC",
      departement:"NC",
      address:" ",
      siret: "NC",
      typeeta: "NC"

      )

    else

    dpteta = ""
        cp = row[5]
        if cp[0..1] = "59"
          dpteta = "Nord"
        elsif cp[0..1] = "62"
          dpteta = "Pas de Calais"
        elsif cp[0..1] = "02"
          dpteta = "Aisne"
        elsif cp[0..1] = "80"
          dpteta = "Somme"
        elsif cp[0..1] = "60"
          dpteta = "oise"
        end


      etablissement = Etablissement.create!(
      id: eta,
      nom: row[1],
      rue: row[4],
      codepostal: row[5],
      ville: row[6],
      departement: dpteta,
      address: row[4] + " " + row[5] + " " + row[6],
      siret: "NC",
      typeeta: "NC"
      )

    end
     etablissement.save
    end


    puts "2 création user"


    ifuser = User.where(email: row[8])

    if ifuser.length == 0
      if row[8].nil?
      user = User.create!(
        email: "nc@nc.fr" + l.to_s,
        password: "Bossanova1",
        statut: "adherent"
        )
        l = l + 1
      else
        user = User.create!(
              email: row[8],
              password: "Bossanova1",
              statut: "adherent"
        )
      end
    else
      if row[8].nil?
      user = User.create!(
        email: "nc@nc.fr" + l.to_s,
        password: "Bossanova1",
        statut: "adherent"
      )
      l = l + 1
      else
      user = User.create!(
        email: row[8] + l.to_s,
        password: "Bossanova1",
        statut: "adherent"
      )
      l = l + 1
      end
    end
    user.save
    puts "3 création Adhérent"
    et = Etablissement.where(nom: row[1])
    if row[4].nil? || row[5].nil? || row[6].nil?
      if row[7].nil?
        prof = Adherent.create!(
          prenom: row[3],
          nom: row[2],
          id: num,
          rue: "NC",
          codepostal: "NC",
          ville: "NC",
          departement: "NC",
          siret: "NC",
          emploi: "Chirurgien-Dentiste",
          tauxhorairesemaine: "NC",
          naissance: "NC",
          sexe: "NC",
          telephone: "NC",
          numsecu: "NC",
          respactnucleaire: "NC",
          address: "",
          user_id: user.id,
          etablissement_id: et.last.id,
          pcr: "Michel STAUMONT",
          email: user.email
        )
      else
        prof = Adherent.create!(
          prenom: row[3],
          nom: row[2],
          id: num,
          rue: "NC",
          codepostal: "NC",
          ville: "NC",
          departement: "NC",
          siret: "NC",
          emploi: "Chirurgien-Dentiste",
          tauxhorairesemaine: "NC",
          naissance: "NC",
          sexe: "NC",
          telephone: row[7],
          numsecu: "NC",
          respactnucleaire: "NC",
          address: "",
          user_id: user.id,
          etablissement_id: et.last.id,
          pcr: "Michel STAUMONT",
          email: user.email
        )
      end
    else

       dpt = ""
        cp = row[5]
        if cp[0..1] = "59"
          dpt = "Nord"
        elsif cp[0..1] = "62"
          dpt = "Pas de Calais"
        elsif cp[0..1] = "02"
          dpt = "Aisne"
        elsif cp[0..1] = "80"
          dpt = "Somme"
        elsif cp[0..1] = "60"
          dpt = "oise"
        end

      if row[7].nil?





        prof = Adherent.create!(
          prenom: row[3],
          nom: row[2],
          id: num,
          rue: row[4],
          codepostal: row[5],
          ville: row[6],
          departement: dpt,
          siret: "NC",
          emploi: "Chirurgien-Dentiste",
          tauxhorairesemaine: "NC",
          naissance: "NC",
          sexe: "NC",
          telephone: "NC",
          numsecu: "NC",
          respactnucleaire: "NC",
          address: row[4] + " " + row[5] + " " + row[6],
          user_id: user.id,
          etablissement_id: et.last.id,
          pcr: "Michel STAUMONT",
          email: user.email
        )
      else
        prof = Adherent.create!(
          prenom: row[3],
          nom: row[2],
          id: num,
          rue: row[4],
          codepostal: row[5],
          ville: row[6],
          departement: dpt,
          siret: "NC",
          emploi: "Chirurgien-Dentiste",
          tauxhorairesemaine: "NC",
          naissance: "NC",
          sexe: "NC",
          telephone: row[7],
          numsecu: "NC",
          respactnucleaire: "NC",
          address: row[4] + " " + row[5] + " " + row[6],
          user_id: user.id,
          etablissement_id: et.last.id,
          pcr: "Michel STAUMONT",
          email: user.email
        )
      end
    end
    prof.save

  end

puts 'création du profil admin '
useradmin = User.create!(
        email: "staumont.antoine@me.com",
        password: "Bossanova1",
        statut: "admin"
      )
useradmin.save
