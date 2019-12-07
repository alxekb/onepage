import React from "react"
import PropTypes from "prop-types"

class Button extends React.Component {
  constructor(props) {
    super(props);
    this.state = { hasError: false };
  }
  render () {
    return (
      <input
        className='btn btn-outline-primary'
        name='B'
        placeholder='0'
        type='submit'
        value={this.props.cmd}
        onChange={this.handleInputChange}
      />
    );
  }
}

export default Button
