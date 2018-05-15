import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store.js';
import Root from './root';

// import {fetchTasks} from './util/taskApiUtil';
import {fetchTasks} from './actions/taskActions';

document.addEventListener('DOMContentLoaded', () => {
  let store = configureStore();
  
  // testing
  window.fetchTasks = fetchTasks();
  window.dispatch = store.dispatch
  
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});