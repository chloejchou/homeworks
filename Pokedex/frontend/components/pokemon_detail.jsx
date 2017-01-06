import React from 'react';
import { Link } from 'react-router';

class PokemonDetail extends React.Component {
  componentDidMount() {
    this.props.requestPokemon(this.props.params.pokemonId);
  }

  componentWillReceiveProps(newProps) {
    if (newProps.params.pokemonId !== this.props.params.pokemonId) {
      this.props.requestPokemon(newProps.params.pokemonId);
    }
  }

  render() {
    // debugger
    return (
      <div>
        <h1>{this.props.pokemonDetail.name}</h1>
        <ul>
          <li>Type: {this.props.pokemonDetail.poke_type}</li>
          <li>Attack: {this.props.pokemonDetail.attack}</li>
          <li>Defense: {this.props.pokemonDetail.defense}</li>
        </ul>

        <p>Moves</p>
        <ul>
          {this.props.pokemonDetail.moves.map((move, idx) => (
            <li key={idx}>{move}</li>
          ))}
        </ul>

        <p>Items</p>
        <ul>
          {this.props.pokemonDetail.items.map((item) => (
            <li key={item.id}>
              <Link to={`/pokemon/${this.props.params.pokemonId}/item/${item.id}`}>
                <img className="item_img" src={item.image_url}></img>
              </Link>
            </li>
          ))}
        </ul>

        {this.props.children}
      </div>
    );
  }
}

export default PokemonDetail;
