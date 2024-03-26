namespace :budget_item do
  desc "This task will import suplies from excel sheet and insert them in suplies table"
  task import: :environment do
    sheet = Roo::CSV.new('lib/tasks/budget.csv')

    (2..sheet.last_row).each do |row|
      record = sheet.row(row)
      post = BudgetItem.create(partida: record[0],
                              descripcion: record[1],
                              monto_disp: record[2],
                              last_updated: record[3],
                              update_type: record[4])
      puts post.partida
      puts post.descripcion
      puts post.monto_disp
      puts post.last_updated
      puts post.update_type
    end
  end


end
