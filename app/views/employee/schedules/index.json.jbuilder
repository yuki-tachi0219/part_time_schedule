json.array!(@schedules) do |schedule|
  json.id schedule.id
  json.title schedule.employee.last_name
  json.start schedule.starting_time
  json.end schedule.closing_time
end
