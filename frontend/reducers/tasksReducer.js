import merge from 'lodash/merge';
import { RECEIVE_TASKS } from '../actions/taskActions'

const defaultState = [];

const TasksReducer = (state = defaultState, action) => {
  Object.freeze(state);
  let newState;
  switch (action.type) {
    case RECEIVE_TASKS:
    newState = action.tasks
      return newState;
    default:
      return state;
  }
};

export default TasksReducer;