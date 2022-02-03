puts "----------------------------------------------"
puts "MENU PRINCIPAL"
puts "----------------------------------------------"

puts "
1: Réinitialisation de la base de donnée
2: Importation des établissements
3: Importation des adhérents
4: Importation du personnel
5: Importation du matériel
6:
7: Importation de la base des générateurs et capteurs
8: Importation de la base des pcr , medecins du travail"

command = STDIN.gets.chomp


if command == "1"
puts "Réinitialisation de la base de donnée"
User.destroy_all
Adherent.destroy_all
Etablissement.destroy_all
Pcr.destroy_all
Capteurbase.destroy_all
Generateurbase.destroy_all
Message.destroy_all
Medecin.destroy_all




elsif command == "2"

  xls_file = Roo::Excelx.new('db/etablissements.xlsx')
  s = Roo::CSV.new("db/etablissements.csv")
  xls_file.to_csv("db/etablissements.csv")
  CSV.foreach("db/etablissements.csv") do |row|
    if row[4].to_i > 58999 && row[4].to_i < 60000
      departement = "Nord"
    elsif row[4].to_i > 61999 && row[4].to_i < 63000
      departement = "Pas de Calais"
    elsif row[4].to_i > 79999 && row[4].to_i < 81000
      departement = "Somme"
    elsif row[4].to_i > 59999 && row[4].to_i < 61000
      departement = "Oise"
    elsif row[4].to_i > 1999 && row[4].to_i < 3000
      departement = "Aisne"
    elsif row[4].to_i > 7999 && row[4].to_i < 9000
      departement = "Ardennes"
    end
    if row[8].nil?
      nom = "Cabinet" + row[5]
    end

    puts departement
    if row[8].nil?
    etablissement = Etablissement.create!(

      id: row[0],
      rue: row[1],
      codepostal: row[4],
      ville: row[5],
      departement: departement,
      address: row[1] + " " + row[4] + " " + row[5],
      email: " ",
      telephone: row[10],
      complementrue: row[2],
      pcr_id: row[6],
      siret: row[9],
      typeeta: row[7],
      nom:"Cabinet" + " " + row[5],
      statut: row[3]

      )
    etablissement.save
  else
    etablissement = Etablissement.create!(

      id: row[0],
      rue: row[1],
      codepostal: row[4],
      ville: row[5],
      departement: departement,
      address: row[1] + " " + row[4] + " " + row[5],
      email: " ",
      telephone: row[10],
      complementrue: row[2],
      pcr_id: row[6],
      siret: row[9],
      typeeta: row[7],
      nom:row[8],
      statut: row[3]

      )
    etablissement.save
  end
  end


elsif command == "3"
  puts '-------------------------'
  puts 'Importation des adhérents'
  puts '-------------------------'
  User.destroy_all
  Pcr.destroy_all
  Adherent.destroy_all
  i = 1
  xls_file = Roo::Excelx.new('db/adherents.xlsx')
  s = Roo::CSV.new("db/adherents.csv")
  xls_file.to_csv("db/adherents.csv")
  CSV.foreach("db/adherents.csv") do |row|
    puts row[3] + " " + row[4]
    #if row[14].nil?
    puts "Creation de l'user"
      user = User.create!(
      statut: "adherent",
      email:i.to_s + row[4] + "@aacdor.fr" ,
      password: "Bossanova1")
      i = i + 1
    #else
     # user = User.create!(
     # statut: "adherent",
     # email:row[14] ,
     # password: "Bossanova1" )
    #end
    user.save
    puts "Creation de l'adhérent"

    adherent = Adherent.create!(
      rue: row[6],
      codepostal: row[8],
      ville: row[9],
      departement: "NC",
      nom: row[3],
      prenom: row[4] ,
      siret: row[10],
      tauxhorairesemaine: row[12],
      naissance: row[5],
      sexe: row[0],
      telephone: row[13],
      numsecu: row[11],
      respactnucleaire: row[16],
      user_id: user.id,
      address: row[6] + " " + row[8] + " " + row[9],
      detailadresse: row[7],
      etablissement_id: row[2] ,
      email: row[14],
      statut: row[1]



      )

    adherent.save

  end
    useradmin = User.create!(
        email: "staumont.antoine@me.com",
        password: "Bossanova1",
        statut: "admin"
      )
  useradmin.save

elsif command == "4"

  puts '------------------------'
  puts 'Importation du personnel'
  puts '------------------------'
  Personnel.destroy_all


  xls_file = Roo::Excelx.new('db/personnel.xlsx')
  s = Roo::CSV.new("db/personnel.csv")
  xls_file.to_csv("db/personnel.csv")
  CSV.foreach("db/personnel.csv") do |row|
    puts row[3] + " " + row[4]
    personnel = Personnel.create!(
      nom: row[3],
      prenom: row[4],
      numsecu: "NC",
      emploi: row[1] ,
      statut: row[2] ,
      sexe: row[5],
      etablissement_id: row[0],
      radiocomp: "NC",
      datenaissance: "NC",
      rue: "NC",
      codepostal: "NC",
      ville: "NC",
      email: "NC",
      telephone: "NC"

      )

    personnel.save

  end

elsif command == "5"

  puts '-----------------------'
  puts 'Importation du matériel'
  puts '-----------------------'
  Materiel.destroy_all
  xls_file = Roo::Excelx.new('db/materiel.xlsx')
  s = Roo::CSV.new("db/materiel.csv")
  xls_file.to_csv("db/materiel.csv")
  CSV.foreach("db/materiel.csv") do |row|
  puts row[3]
    materiel = Materiel.create!(
      etablissement_id: row[0],
      statut: row[1],
      typemat: row[2],
      marque: row[3],
      modele: row[4],
      numserie: row[5],
      anfab: row[6],
      anmes: row[7],
      empla: row[8],
      numasn: row[9],
      datasn: row[10],
      numsigis: row[11],
      tensionmax: row[12],
      intensitemax: row[13],
      tempsmoyen: row[14],

      mesorgagree: row[16]


      )

    materiel.save
  end


elsif command == "6"


elsif command == "7"

  puts '--------------------------------------'
  puts 'Importation de la base des générateurs'
  puts '--------------------------------------'

  xls_file = Roo::Excelx.new('db/generateurbase.xlsx')
  s = Roo::CSV.new("db/generateurbase.csv")
  xls_file.to_csv("db/generateurbase.csv")
  CSV.foreach("db/generateurbase.csv") do |row|
    generateurbase = Generateurbase.create!(
      marque: row[0],
      modele: row[1],
      typegen: row[2]
    )
  generateurbase.save
  end
  puts '-----------------------------------'
  puts 'Importation de la base des capteurs'
  puts '-----------------------------------'
  xls_file = Roo::Excelx.new('db/capteurbase.xlsx')
  s = Roo::CSV.new("db/capteurbase.csv")
  xls_file.to_csv("db/capteurbase.csv")
  CSV.foreach("db/capteurbase.csv") do |row|
    capteurbase = Capteurbase.create!(
      marque: row[0],
      modele: row[1],
      typecap: row[2]
    )
  capteurbase.save
  end

  elsif command == "8"



  puts '-------------------------------'
  puts 'Importation de la base des pcrs'
  puts '-------------------------------'
  xls_file = Roo::Excelx.new('db/rcp.xlsx')
  s = Roo::CSV.new("db/rcp.csv")
  xls_file.to_csv("db/rcp.csv")
  CSV.foreach("db/rcp.csv") do |row|
    puts row[2]
    puts row[3]

    user = User.create!(

      email: row[9],
      password: "Bossanova1",
      statut: "pcr"

      )
    pcr = Pcr.create!(

      id: row[0],
      statut: row[1],
      nom: row[2],
      prenom: row[3] ,
      rue: row[4],
      codepostal: row[5],
      ville: row[6],
      datenaissance: row[7] ,
      telephone: row[8],
      email: row[9],
      dateexpdiplome: row[10],
      content: row[11],
      user_id: user.id

      )

    user.save
    pcr.save

  end

  puts '----------------------------------------------'
  puts 'Importation de la base des medecins du travail'
  puts '----------------------------------------------'

  xls_file = Roo::Excelx.new('db/medecintravail.xlsx')
  s = Roo::CSV.new("db/medecintravail.csv")
  xls_file.to_csv("db/medecintravail.csv")
  CSV.foreach("db/medecintravail.csv") do |row|
    puts row[0]
    puts row[1]
  medecin = Medecin.create!(
      nom: row[0],
      prenom: row[1],
      sexe: row[2],
      rpps: row[3],
      email: row[4],
      nometa: row[5],
      rue: row[6],
      complementrue: row[7],
      codepostal: row[8],
      ville: row[9],
      siret: row[10],
      telephone: row[11],
      siseri: row[12]

    )
    medecin.save
  end

end
