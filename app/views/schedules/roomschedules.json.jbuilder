json.array!(@schedules) do |schedule|
  json.id schedule.id
  json.title schedule.name
  json.start schedule.start_at
  json.end schedule.end_at
  json.url schedule_url(schedule, format: :html)
end