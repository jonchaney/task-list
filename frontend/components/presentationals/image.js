import React, { Component } from 'react';

class Image extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <img src={this.props.image} 
           className="image"
           alt={this.props.alt} 
           height={this.props.height} 
           width={this.props.width} />
    );
  }
}

export default Image;