import React from 'react'
import PropTypes from 'prop-types'
import Inputs from './Inputs'
import Buttons from "./Buttons"
import Result from "./Result"

class Calc extends React.Component {
  state = {
    result: 0
  }

  render () {
    return (
      <div className='container'>
        <h1 className='card-title display-4 text-secondary text-center'>Calculator</h1>
        <p className='small text-muted text-center'>
          A simple calculator designed to process base math operations.
        </p>
        <div className='card'>
          <div className='card-header'>
            <Result content={'0'}/>
          </div>
          <div className='card-body'>
            <Inputs />
            <Buttons />
          </div>
        </div>
      </div>
    )
  }
}

Calc.propTypes = {
  a: PropTypes.string,
  b: PropTypes.string,
  cmd: PropTypes.string,
  result: PropTypes.string
}
export default Calc
