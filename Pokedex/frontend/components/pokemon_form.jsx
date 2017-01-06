import React from 'react';
import { withRouter } from 'react-router';

class PokemonForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: '',
      image_url: '',
      poke_type: '',
      attack: '',
      defense: '',
      move1: '',
      move2: ''
    };

    this.update = this.update.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update(property) {
    return e => this.setState({ [property]: e.target.value });
  }

  handleSubmit(e) {
    // debugger
    e.preventDefault();
    this.props.createPokemon(this.state).then(newPokemon => {
      this.props.router.push(`pokemon/${newPokemon.id}`);
    });
  }

  render() {
    const TYPES = [
      "fire",
      "electric",
      "normal",
      "ghost",
      "psychic",
      "water",
      "bug",
      "dragon",
      "grass",
      "fighting",
      "ice",
      "flying",
      "poison",
      "ground",
      "rock",
      "steel"
    ];

    return (
      <div>
        <form onSubmit={this.handleSubmit}>
          <input type="text" value={this.state.name} placeholder="Name" onChange={this.update("name")}></input>
          <input type="text" value={this.state.image_url} placeholder="Image URL" onChange={this.update("image_url")}></input>

          <select value={this.state.poke_type} onChange={this.update("poke_type")} defaultValue="Select Pokemon Type">
            {TYPES.map((type, idx) => (
              <option value={type} key={idx}>{type}</option>
            ))}
          </select>

          <input type="text" value={this.state.attack} placeholder="Attack" onChange={this.update("attack")}></input>
          <input type="text" value={this.state.defense} placeholder="Defense" onChange={this.update("defense")}></input>
          <input type="text" value={this.state.move1} placeholder="Move 1" onChange={this.update("move1")}></input>
          <input type="text" value={this.state.move2} placeholder="Move 2" onChange={this.update("move2")}></input>
          <input type="submit" value="Create Pokemon"></input>
      </form>
      </div>
    );
  }

}

export default withRouter(PokemonForm);
