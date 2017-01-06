import _ from 'lodash';

export const selectAllPokemon = state => {
  return _.values(state.pokemon);
};

export const selectPokemonItem = (state, itemId) => {
  let returnItem = undefined;
  state.pokemonDetail.items.forEach(item => {
    if (item.id === itemId) {
      returnItem = item;
    }
  });
  return returnItem;
};
