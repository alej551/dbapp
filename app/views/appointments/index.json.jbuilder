json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :date, :time, :checkout, :client_name, :client_email, :client_phone, :service
  json.url appointment_url(appointment, format: :json)
end
