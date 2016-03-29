json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :date, :time,  :client_name, :client_email, :client_phone, :service, 
end
