Create a grouped task list with task dependencies

1. Build a task list UI in React using included design and SVG assets
2. The top level should show a list of task groups w/ # of tasks inside
3. Clicking a group should display the list of all tasks for that group
4. Tasks remain locked until all dependent tasks are complete
5. Clicking a task should mark it as complete or incomplete, unless the task is locked
6. Dependencies that don't point to a loaded task should be ignored

Scoring Criteria

As an engineering team we focus on clear conventions, best practices, and code quality.
We'll look for clear structure and naming, thoughtful organization of files and components,
and keeping things simple. We're also kind of anal about bugs, so we'll test the app to make sure
everything aligns to the above criteria.

This is your chance to lay out a project as you think it should be done, so focus on doing it
"the right way" rather than throwing in any bells and whistles.

Example Payload:
[
  {
    id: 1,
    group: "Purchases",
    task: "Go to the bank",
    dependencyIds: [],
    completedAt: null,
  },
  {
    id: 2,
    group: "Purchases",
    task: "Buy hammer",
    dependencyIds: [1],
    completedAt: null,
  },
  {
    id: 3,
    group: "Purchases",
    task: "Buy wood",
    dependencyIds: [1],
    completedAt: null,
  },
  {
    id: 4,
    group: "Purchases",
    task: "Buy nails",
    dependencyIds: [1],
    completedAt: null,
  },
  {
    id: 5,
    group: "Purchases",
    task: "Buy paint",
    dependencyIds: [1],
    completedAt: null,
  },
  {
    id: 6,
    group: "Build Airplane",
    task: "Hammer nails into wood",
    dependencyIds: [2, 3, 4],
    completedAt: null,
  },
  {
    id: 7,
    group: "Build Airplane",
    task: "Paint wings",
    dependencyIds: [5, 6],
    completedAt: null,
  },
  {
    id: 8,
    group: "Build Airplane",
    task: "Have a snack",
    dependencyIds: [11],
    completedAt: null,
  }
]
