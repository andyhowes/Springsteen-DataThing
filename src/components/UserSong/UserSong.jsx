import React, { useState, useEffect } from 'react';
import { useHistory, useParams } from 'react-router-dom';
import {useDispatch, useSelector} from 'react-redux';
import './UserSong.css';

// CUSTOM COMPONENTS
import RegisterForm from '../RegisterForm/RegisterForm';

function UserSong(props) {

  const dispatch = useDispatch();
  const history = useHistory();

  useEffect(() => {
    dispatch({type: 'FETCH_USER_SONG', payload: id });
  }, []);

  const {id} = useParams();

  const userSong = useSelector(store => store.userSong);
  console.log('user song', userSong);


  const goToUserSongs = () =>{
    history.push(`/creations`);
  }

  return (

    <div><p>Food</p></div>
  //   <div className="container">
  //     {userSong.length === 0 ? (<p>...loading...</p>) :
  //     (<section><h1 className="songCap">{userSong.title}</h1>
  //     <div id="songBox">
  //       {userSong.map(lyric => {
  //         return (
  //           <li className="songSingle" key={(lyric.line_id).toString()}>{lyric.fragment_text}</li>
  //         )
  //     })}
  //     <button id="backButton" onClick={goToUserSongs}>Back</button>
  //     </div>
  //     <img src="/images/rs-207507-NOLA_006.jpg.webp" id="songPageBruce"></img>
  //     </section>)
  //     }
  //   </div>
  )
}

export default UserSong;
