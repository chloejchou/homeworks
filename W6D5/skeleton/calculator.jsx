import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    // your code here
    this.state = { result: 0, num1: "", num2: "" };
  }

  setNum1(e) {
    e.preventDefault();
    this.setState({num1: e.currentTarget.value});
  }

  setNum2(e) {
    e.preventDefault();
    this.setState({num2: e.currentTarget.value});
  }

  calculate(e) {
    e.preventDefault();
    const operation = e.currentTarget.textContent;
    this.setState({result: eval(`${this.state.num1}${operation}${this.state.num2}`)});
  }

  reset(e) {
    e.preventDefault();
    this.setState({result: 0, num1: 0, num2: 0});
  }

  render() {
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input onChange={this.setNum1.bind(this)} value={this.state.num1}></input>
        <input onChange={this.setNum2.bind(this)} value={this.state.num2}></input>
        <button onClick={this.calculate.bind(this)}>+</button>
        <button onClick={this.calculate.bind(this)}>-</button>
        <button onClick={this.calculate.bind(this)}>x</button>
        <button onClick={this.calculate.bind(this)}>/</button>
        <br />
        <button onClick={this.reset.bind(this)}>Reset</button>
      </div>
    );
  }
}

export default Calculator;
