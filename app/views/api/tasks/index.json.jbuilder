json.array! @tasks do |task|
    json.id task.id
    json.group task.group.name
    json.name task.name
    json.dependencyIds task.dependencies.pluck(:dependency_id)
    json.completedAt task.completed_at
end 

