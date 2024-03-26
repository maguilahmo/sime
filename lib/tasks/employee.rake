namespace :employee do
  desc "This task will import suplies from excel sheet and insert them in suplies table"
  task import: :environment do
    sheet = Roo::CSV.new('lib/tasks/Empleados.csv')

    (2..sheet.last_row).each do |row|
      record = sheet.row(row)
      post = Employee.create(
              name: record[0],
              email: record[1],
              phone: record[2],
              clock_num: record[3],
              role: record[4],
              salary_level: [5],
              delegacion: record[6],
              compensations: record[7],
              comp_amount: record[8],
              status: record[9],
              salary: record[10],
              labor: record[11]
              )
      puts post.name
      puts post.email
      puts post.phone
      puts post.clock_num
      puts post.role
      puts post.salary_level
      puts post.delegacion
      puts post.compensations
      puts post.comp_amount
      puts post.status
      puts post.salary
      puts post.labor
    end
  end
end
