import React, { useState } from 'react';
import { useHistory } from 'react-router-dom';
import './WorkPage.css';
import SavedLines from '../SavedLines/SavedLines';
import EditorPane from '../EditorPane/EditorPane';

// CUSTOM COMPONENTS
import RegisterForm from '../RegisterForm/RegisterForm';

function WorkPage() {
  const [heading, setHeading] = useState('Welcome');
  const history = useHistory();

  const onLogin = (event) => {
    history.push('/login');
  };

  return (
    <div className="workBox">
      <h1 className="CapitalizedFranklin">SPRINGSTEEN</h1>
      <div className="grid">
        <div className="grid-col grid-col_8">
        </div>

      </div>
      <section id="savedLinesBox">
        <SavedLines />
      </section>

    </div>
  );
}

export default WorkPage;
