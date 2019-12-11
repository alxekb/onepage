import React from 'react';
import {
  BrowserRouter,
  Switch,
  Route,
  Redirect,
  Link
} from 'react-router-dom';
import PropTypes from 'prop-types';
import Calc from "./Calc";

class App extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      username: null
    }
  }

  render () {
    return (
      <BrowserRouter>
        <Switch>
          <Route path='/' component={Calc} />
        </Switch>
      </BrowserRouter>
    )
  }
}

export default App
