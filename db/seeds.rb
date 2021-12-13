User.destroy_all
Adherent.destroy_all
xls_file = Roo::Excelx.new('db/adherent.xlsx')
s = Roo::CSV.new("db/adherent.csv")
xls_file.to_csv("db/adherent.csv")
l = 1
CSV.foreach("db/adherent.csv") do |row|
    num = Adherent.all.count + 1
    puts row[2]
    puts "création user"
    puts "taille email"
    if row[8].nil?
      puts "email vierge"
    else
      puts row[8].length
    end
    ifuser = User.where(email: row[8])
    puts "taille ifuser"
    puts ifuser.length
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
    puts "création profile"
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
          user_id: user.id
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
          user_id: user.id
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
          user_id: user.id
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
          user_id: user.id
        )
      end
    end
    prof.save
  end
