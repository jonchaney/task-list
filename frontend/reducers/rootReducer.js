import { combineReducers } from 'redux';

import TaskReducer from './tasksReducer';

const RootReducer = combineReducers({
  tasks: TaskReducer
});

export default RootReducer;