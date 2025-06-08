import React, { useState, useEffect } from 'react';

function App() {
  const [message, setMessage] = useState('');
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch('/api/hello')
      .then(response => response.json())
      .then(data => {
        setMessage(data.message);
        setLoading(false);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
        setLoading(false);
      });
  }, []);

  return (
    <div className="App">
      <header className="App-header">
        <h1>GitOps React + Java App</h1>
        {loading ? (
          <p>Loading...</p>
        ) : (
          <p>Message from backend: {message}</p>
        )}
      </header>
    </div>
  );
}

export default App;