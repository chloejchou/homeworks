import { RECEIVE_POKEMON } from '../actions/pokemon_actions';

const defaultState = {
  moves: [],
  items: []
};

const PokemonDetailReducer = (oldState = defaultState, action) => {
  Object.freeze(oldState);
  switch(action.type) {
    case RECEIVE_POKEMON:
      return action.pokemon;
    default:
      return oldState;
  }
};

export default PokemonDetailReducer;
