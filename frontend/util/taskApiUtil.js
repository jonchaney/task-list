export const fetchTasks = id => (
  $.ajax({
    method: 'GET',
    url: 'api/tasks'
  })
);