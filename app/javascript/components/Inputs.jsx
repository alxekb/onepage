import React from "react"
import PropTypes from "prop-types"
import Input from './Input';

class Inputs extends React.Component {
  render () {
    return (
      <form>
          <Input label={'A'} value={'3'}/>
          <Input label={'B'} value={'1'} />
      </form>
    );
  }
}

export default Inputs
