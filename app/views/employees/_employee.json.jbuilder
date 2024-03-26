json.extract! employee, :id, :name, :email, :phone, :clock_num, :role, :salary_level, :delegacion, :compensations, :comp_amount, :status, :salary, :labor, :created_at, :updated_at
json.url employee_url(employee, format: :json)
