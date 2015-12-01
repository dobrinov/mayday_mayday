json.array! @series do |host, serie|
  json.name host
  json.data do
    json.array! serie do |measurement|
      json.array! [measurement.created_at.to_i * 1000, measurement.value]
    end
  end
end

# json.array! @measurements do |measurement|
#   json.array! [measurement.created_at.to_i * 1000, measurement.value]
# end
