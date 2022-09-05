import React, { useEffect } from 'react';
import {
  HashRouter as Router,
  Redirect,
  Route,
  Switch,
} from 'react-router-dom';

import { useDispatch, useSelector } from 'react-redux';

import Nav from '../Nav/Nav';
import Footer from '../Footer/Footer';

import ProtectedRoute from '../ProtectedRoute/ProtectedRoute';

import UserPage from '../UserPage/UserPage';
import Details from '../Details/Details';
import LandingPage from '../LandingPage/LandingPage';
import LoginPage from '../LoginPage/LoginPage';
import RegisterPage from '../RegisterPage/RegisterPage';
import LinesList from '../LinesList/LinesList';
import SongOfLines from '../SongOfLines/SongOfLines';
import SavedLines from '../SavedLines/SavedLines';
import WorkPage from '../WorkPage/WorkPage';
import EditorPane from '../EditorPane/EditorPane';
//import CreationPane from '../CreationPane/CreationPane';

import './App.css';

function App() {
  const dispatch = useDispatch();

  const user = useSelector(store => store.user);

  useEffect(() => {
    dispatch({ type: 'FETCH_USER' });
  }, [dispatch]);

  return (
    <Router>
      <div>
        <Nav />
        <Switch>
          {/* Visiting localhost:3000 will redirect to localhost:3000/home */}
          <Redirect exact from="/" to="/home" />

          {/* Visiting localhost:3000/about will show the about page. */}


          {/* For protected routes, the view could show one of several things on the same route.
            Visiting localhost:3000/user will show the UserPage if the user is logged in.
            If the user is not logged in, the ProtectedRoute will show the LoginPage (component).
            Even though it seems like they are different pages, the user is always on localhost:3000/user */}
          <ProtectedRoute
            // logged in shows UserPage else shows LoginPage
            exact
            path="/user"
          >
            <UserPage />
          </ProtectedRoute>

          <ProtectedRoute
            // logged in shows InfoPage else shows LoginPage
            exact
            path="/info"
          >
            <Details />
          </ProtectedRoute>

          <Route
            exact
            path="/login"
          >
            {user.id ?
              // If the user is already logged in,
              // redirect to the /user page
              <Redirect to="/user" />
              :
              // Otherwise, show the login page
              <LoginPage />
            }
          </Route>

          <Route
            exact
            path="/registration"
          >
            {user.id ?
              // If the user is already logged in,
              // redirect them to the /user page
              <Redirect to="/user" />
              :
              // Otherwise, show the registration page
              <RegisterPage />
            }
          </Route>

          <Route
          exact
          path="/song_of_lines/:id"
          >
            <SongOfLines />
            {/* {user.id ?

              <Redirect to="/user" />
              :

              <LandingPage />
            } */}
          </Route>

          <Route
          exact
          path="/home"
          >
            {/* {user.id ?
              // If the user is already logged in,
              // redirect them to the /user page
              <Redirect to="/user" /> */}
              {/* :
              // Otherwise, show the Landing page */}
            <LandingPage />
            {/* } */}
          </Route>

          <Route
          exact
          path="/details/:id"
          >
            <Details />
            {/* {user.id ?

              <Redirect to="/user" />
              :

              <LandingPage />
            } */}
          </Route>

          <Route
          exact
          path="/savedlines"
          >
            <SavedLines />
            {/* {user.id ?

              <Redirect to="/user" />
              :

              <LandingPage />
            } */}
          </Route>

          <Route
          exact
          path="/lines"
          >
            <LinesList />
            {/* {user.id ?

              <Redirect to="/user" />
              :

              <LandingPage />
            } */}
          </Route>

          <Route
          exact
          path="/workpage"
          >
            <WorkPage />
          </Route>

          <Route
          exact
          path="/editor"
          >
            <EditorPane />
            {/* {user.id ?

              <Redirect to="/user" />
              :

              <LandingPage />
            } */}
          </Route>

          {/* If none of the other routes matched, we will show a 404. */}
          <Route>
            <h1>404</h1>
          </Route>
        </Switch>
        <Footer />
      </div>
    </Router>
  );
}

export default App;
