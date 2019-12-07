import React from "react"
import PropTypes from "prop-types"

class Input extends React.Component {
  render () {
    return (
      <div className='input-group mb-3 input-group-lg'>
        <div className='input-group-prepend'>
          <span className='input-group-text'>{this.props.label}</span>
          <p></p>
        </div>
          <input
            className='input-group-prepend form-control'
            name='Name'
            type='number'
            placeholder='0'
            defaultValue={this.props.value}
            onChange={this.handleInputChange}
          />
      </div>
    );
  }
}

export default Input
