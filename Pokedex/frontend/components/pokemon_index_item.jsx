import React from 'react';
import { Link } from 'react-router';

const PokemonIndexItem = ({ pokemon }) => (
  <li>
    <Link to={`/pokemon/${pokemon.id}`}>
      {pokemon.name}
      <img src={pokemon.image_url} className='smallImage'></img>
    </Link>
  </li>
);

export default PokemonIndexItem;
