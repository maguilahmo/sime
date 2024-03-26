namespace :suply do
  desc "This task will import suplies from excel sheet and insert them in suplies table"
  task import: :environment do
    sheet = Roo::CSV.new('lib/tasks/suplies_1.csv')

    (2..sheet.last_row).each do |row|
      record = sheet.row(row)
      post = Suply.create(pn: record[0], descripcion: record[1] , presentacion: record[2], budget_item_id: record[3], costo_u: record[4])
      puts post.pn
      puts post.descripcion
      puts post.presentacion
      puts post.budget_item_id
      puts post.costo_u
    end
  end


end
