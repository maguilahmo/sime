class School < ApplicationRecord

  def self.ransackable_attributes(auth_object = nil)
    ["ambito", "calle", "cct", "colonia", "created_at", "detalle", "docentes", "entre_calle", "id", "id_value", "latitud", "localidad", "longitud", "matricula", "municipio", "nivel", "nombre", "numero", "p_de_apoyo", "sector", "subnivel", "turno", "updated_at", "y_calle", "zona_esc"]
  end
  
end
