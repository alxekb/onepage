import React from 'react'
import { connect } from 'react-redux';
import { createStructuredSelector } from "reselect";
import {Field, Form, Formik, ErrorMessage} from "formik";
import axios from "axios";
import Result from "./Result";

class Calc extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      username: 'alxekb',
      response: '{}',
      result: 'HELLO'
    }
  }
  render () {
    return (
      <div className='container'>
        <h1 className='card-title display-4 text-secondary text-center'>Calculator</h1>
        <p className='small text-muted text-center'>
          A simple calculator designed to process base math operations.
        </p>
        <p className='text-center'> {this.state.response}</p>
        <div className='card' style={{ width: '512px' }}>
          <div className='card-header'>
            <Result content={this.state.result}/>
          </div>
          <div className='card-body'>
            <Formik
              onSubmit={(values, { setSubmitting }) => {
                setTimeout(() => {
                  axios({
                      method: 'post',
                      url: '/api/v1/equation',
                      data: values
                  })
                  .then(result => {
                    this.setState({
                      response: JSON.stringify(result.data),
                      result: result.data.result
                    });
                  })
                  .catch(error => {
                    this.setState({
                      response: JSON.stringify(error.data),
                      result: 'ERROR'
                    });
                  });
                  setSubmitting(false);
                }, 400);
              }}
              initialValues={{a: 2, b: 2, username: 'alxekb', cmd: '+'}}
              validate={values => {
                const errors = {};
                if (!values.a) {errors.a = 'Values \'A\' is required'}
                else if (!values.b) {errors.b = 'Values \'B\' is required'}
                else if (!/^\d+$/i.test(values.a)) {errors.a = 'It should be integer'}
                else if (!/^\d+$/i.test(values.b)) {errors.b = 'It should be integer'}
                else if (values.a.toString().length > 3) {errors.a = 'Number \'A\'is too long!'}
                else if (values.b.toString().length > 3) {errors.b = 'Number \'B\' is too long!'}
                else if (!values.username) {errors.username = 'Username is required'}
                else if (!/[A-Z]/i.test(values.username)) {errors.username = 'Invalid username'}
                else if (!values.cmd) {errors.username = 'Command is not present!'}
                return errors;
              }}>
            {({ values,
                errors,
                touched,
                setFieldValue,
                handleSave,
                handleChange,
                handleSubmit,
                isSubmitting
            }) => (
              <Form>
                <div className='form-group'>
                  <Field type='username' onChange={handleChange} name='username' className='form-control' />
                  {errors.username ? <div>{errors.username}</div> : null}
                </div>
                <div className='form-group'>
                  <Field type='a' name='a' onChange={handleChange} className='form-control' />
                  {errors.a ? <div>{errors.a}</div> : null}
                </div>
                <div className='form-group'>
                  <Field type='b' name='b' onChange={handleChange} className='form-control' />
                  {errors.b ? <div>{errors.b}</div> : null}
                </div>
                <Field name={'cmd'} type={'cmd'} hidden={true}/>

                <div className='form-group btn-group btn-group-toggle d-flex'>
                  <button type='button' disabled={isSubmitting} className='btn btn-outline-dark'
                          onClick={e => {
                            setFieldValue('cmd', '+', false);
                            handleSubmit()
                          }}>Sum</button>
                  <button type='button' disabled={isSubmitting} className='btn btn-outline-dark'
                          onClick={e => {
                            setFieldValue('cmd', '-',false);
                            handleSubmit()
                          }}>difference</button>
                  <button type='button' disabled={isSubmitting} className='btn btn-outline-dark'
                          onClick={e => {
                            setFieldValue('cmd', '*',false);
                            handleSubmit()}}
                          >multiply</button>
                  <button type='button' disabled={isSubmitting} className='btn btn-outline-dark'
                          onClick={e => {
                            setFieldValue('cmd', '/',false);
                            handleSubmit()
                          }}>divide</button>
                </div>
              </Form>
            )}
            </Formik>
          </div>
        </div>
      </div>
    )
  }
}
export default Calc
