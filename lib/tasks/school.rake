namespace :school do
    desc "This task will import posts from excel sheet and insert them in schools table"
    task import: :environment do
      sheet = Roo::CSV.new('lib/tasks/escuelas.csv')
   
      (2..sheet.last_row).each do |row|
        record = sheet.row(row)
        post = School.create(cct: record[0], nombre: record[1], turno: record[2], nivel: record[3], subnivel: record[4], detalle: record[5], matricula: record[6], docentes: record[7], p_de_apoyo: record[8], calle: record[9], numero: record[10], entre_calle: record[11], y_calle: record[12], colonia: record[13], municipio: record[14], localidad: record[15], ambito: record[16], zona_esc: record[17], sector: record[18], latitud: record[19], longitud: record[20])
        puts post.cct
        puts post.nombre
        puts post.turno
        puts post.nivel
        puts post.subnivel
        puts post.detalle
        puts post.matricula
        puts post.docentes
        puts post.p_de_apoyo
        puts post.calle
        puts post.numero
        puts post.entre_calle
        puts post.y_calle
        puts post.colonia
        puts post.municipio
        puts post.localidad
        puts post.ambito
        puts post.zona_esc
        puts post.sector
        puts post.latitud
        puts post.longitud
      end
    end
  
  end
  