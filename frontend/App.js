import React from 'react';
import { Route, Switch } from 'react-router-dom';

import Header from "./components/presentationals/header.js";
import TasksContainer from "./components/tasks/tasksContainer.js";

const App = () => (
    <Switch>
        <Route exact path="/" component={Header} />
        <Route exact path="/" component={TasksContainer} />
    </Switch>
);

export default App;