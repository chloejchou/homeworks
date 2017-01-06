import React from 'react';

class ItemDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    // debugger;
    return (
      <div>
        <h1>{this.props.item.name}</h1>
        <p>Happiness: {this.props.item.happiness}</p>
        <p>Price: {this.props.item.price}</p>
      </div>
    );
  }
}

export default ItemDetail;
