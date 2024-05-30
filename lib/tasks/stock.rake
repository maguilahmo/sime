namespace :stock do
  desc "This task will import stocks from excel sheet and insert them in stocks table"
  task import: :environment do
    sheet = Roo::CSV.new('lib/tasks/Stocks.csv')

    (2..sheet.last_row).each do |row|
      record = sheet.row(row)
      post = Stock.create(suply_id: record[0], warehouse_id: record[1], qty: record[2], last_updated: record[3], update_type: record[4])
      puts post.suply_id
      puts post.warehouse_id
      puts post.qty
      puts post.last_updated
      puts post.update_type
    end
  end
end
