import React from 'react'
// import PropTypes from 'prop-types'
import Button from './Button'

class Buttons extends React.Component {
  render () {
    return (
      <div className="btn-group btn-group-lg d-flex">
        <Button cmd={'sum'} />
        <Button cmd={'difference'} />
        <Button cmd={'multiplication'} />
        <Button cmd={'division'}/>
      </div>
    )
  }
}

export default Buttons
