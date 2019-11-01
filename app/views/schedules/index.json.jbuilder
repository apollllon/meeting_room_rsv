json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :title, :description   
  json.start schedule.start_at
  json.end schedule.end_at
end