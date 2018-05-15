import * as APIUtil from '../util/taskApiUtil';
export const RECEIVE_TASKS = "RECEIVE_TASKS";

export const receiveTasks = tasks => ({
    type: RECEIVE_TASKS,
    tasks
});

export const fetchTasks = () => dispatch => {
    return APIUtil.fetchTasks().then(tasks => {
        console.log(receiveTasks(tasks))
        dispatch(receiveTasks(tasks)); 
    }, errors => (
        dispatch(receiveErrors(errors))
    // console.log(errors)
    ));
};