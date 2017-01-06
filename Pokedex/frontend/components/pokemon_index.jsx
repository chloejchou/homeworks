import React from 'react';
import PokemonIndexItem from './pokemon_index_item';

class PokemonIndex extends React.Component {
  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    // debugger
    return (
      <div>
        <ul>
          {this.props.pokemon.map((pokemon) => {
            return (
              <PokemonIndexItem pokemon={pokemon} key={pokemon.id}/>
            );
          })}
        </ul>

        {this.props.children}
      </div>
    );
  }

}

export default PokemonIndex;
