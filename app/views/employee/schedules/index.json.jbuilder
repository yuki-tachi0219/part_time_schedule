  json.array!(@events) do |event|
    json.id event.id
    json.title event.employee.last_name
    json.start event.starting_time
    json.end event.closing_time
  end
