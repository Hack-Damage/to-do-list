json.tasks @current_user_tasks do |task|
  if task.is_complete == true
  json.name task.name
  json.user_id task.user_id
  json.is_complete task.is_complete
  end
end