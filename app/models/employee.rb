class Employee < ApplicationRecord

  def self.ransackable_associations(auth_object = nil)
    []
  end

  def self.ransackable_attributes(auth_object = nil)
    ["clock_num", "comp_amount", "compensations", "created_at", "delegacion", "email", "id", "id_value", "labor", "name", "phone", "role", "salary", "salary_level", "status", "updated_at"]
  end
  
end
