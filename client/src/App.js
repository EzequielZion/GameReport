import './App.css';
import { useState } from "react";
import Axios from "axios";
import { CSVDownload, CSVLink } from "react-csv";

const cron = require("node-cron")

function App() {

  const [topScores, setTopScores] = useState([]);
  const [lastUpdate, setLastUpdate] = useState([]);
  const [tableStats, setTableStats] = useState([]);
  const headers = [
    { label: "Nickname", key: "nickname" },
    { label: "Score", key: "score" },
  ];

  cron.schedule("*/10 * * * * * ", () => {
    getScores();
    getUpdate();
    getTableStats();
  });

  function getScores() {
    Axios.get("http://localhost:3001/scores").then((response) => {
      setTopScores(response.data);
    });
  }

  function getUpdate() {
    Axios.get("http://localhost:3001/update").then((response) => {
      setLastUpdate(response.data);
    })
  }

  function getTableStats() {
    Axios.get("http://localhost:3001/tablestats").then((response) => {
      setTableStats(response.data);
    })
  }


  return (
    <div className="App">
      <h1>
        PSh Game
      </h1>
      <h2>
        Top 10 scores of all time
      </h2>
      <p>
        <i>Last time stats were generated: </i>
        {
          lastUpdate.map((val, key) => {
            var fulldate = val.creation_date;
            var date = fulldate.substring(0, 10);
            var time = fulldate.substring(11, 20);
            return date + " at " + time
          })
        }
      </p>

      <table className="tablaDeDatos">
        <tr>
          <th>Player</th>
          <th>Score</th>
        </tr>
        {
          topScores.map((val, key) => {
            return (
              <tr>
                <td>
                  {val.nickname}
                </td>
                <td>
                  {val.score}
                </td>
              </tr>
            );
          })
        }
      </table>

      <CSVLink
        data={tableStats}
        filename="PSh_Game_Stats.csv"
        headers={headers}
      >
        <button>
          Download as CSV
        </button>
      </CSVLink>
    </div>
  );
}

export default App;
