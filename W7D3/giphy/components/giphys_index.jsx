import React, { Component } from 'react';

class GiphysIndex extends React.Component {
  render() {
    const giphys = this.props.giphys;
    if (giphys.length === 0) {
      return <div></div>;
    } else {
      return (
        <div>
          {giphys.map((giphy) => (
            <img src={giphy.images.fixed_height.url}></img>
          ))};
        </div>
      );
    }
  }
}

export default GiphysIndex;
