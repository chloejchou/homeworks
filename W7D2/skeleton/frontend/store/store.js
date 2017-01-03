import { createStore, applyMiddleware } from 'redux';
import RootReducer from '../reducers/root_reducer';

const addLoggingToDispatch = store => next => action => {
  // const storeDispatch = store.dispatch;

  console.log(`Original State: ${store.getState()}`);
  console.log(`Action: ${action.type}`);
  next(action);
  console.log(`New State: ${store.getState()}`);
};

const configureStore = (preloadedState = {}) => {
  const store = createStore(RootReducer, preloadedState, applyMiddleware(addLoggingToDispatch));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

export default configureStore;
