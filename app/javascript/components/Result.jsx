import React from "react"
import PropTypes from "prop-types"

class Result extends React.Component {
  render () {
    return (
      <div className={'text-right calc-font'}>
        <h2 className='display-4 text-secondary'>
          {this.props.content}
        </h2>
      </div>
    )
  }
}

export default Result
