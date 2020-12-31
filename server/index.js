const express = require('express')
const app = express()
const mysql = require('mysql')
const cron = require("node-cron")
const axios = require('axios')
const cors = require("cors");

app.use(cors());

app.listen(3001, () => {
    console.log("vamooo el server funca");
});

const db = mysql.createConnection({
    user: "root",
    host: "localhost",
    password: "",
    database: "psh_devtest"
});

db.connect((err) => {
    if (err) {
        console.log("Error conectando la DB")
    }
    else {
        console.log("Exito conectando la DB")
    }
});

app.get('/scores', (req, res) => {
    var queryTopScores = 'SELECT psh_players.nickname, psh_game.score FROM psh_players INNER JOIN psh_game ON psh_game.id_player=psh_players.id_player ORDER BY score DESC LIMIT 10'
    db.query(queryTopScores, (err, result) => {
        if (err) {
            console.log(err)
        } else {
            var resJSON = JSON.stringify(result);
            res.send(resJSON)
        }
    })

})

app.get('/update', (req, res) => {
    var queryLastUpdate = 'SELECT creation_date FROM psh_game ORDER BY creation_date DESC LIMIT 1';
    db.query(queryLastUpdate, (err, result) => {
        if (err) {
            console.log(err)
        } else {
            var resJSON = JSON.stringify(result);
            res.send(resJSON)
        }
    })
})

app.get('/tablestats', (req, res) => {
    var queryTableStats = 'SELECT psh_players.nickname, psh_game.score FROM psh_players INNER JOIN psh_game ON psh_game.id_player=psh_players.id_player';
    db.query(queryTableStats, (err, result) => {
        if (err) {
            console.log(err)
        } else {
            res.send(result)
        }
    })
})

cron.schedule(" */5 * * * * ", () => {
    var cantJugadores = parseInt(Math.random() * 10);
    axios({
        method: 'GET',
        url: 'https://randomuser.me/api/?inc=name,picture&results=' + cantJugadores,
    }).then(res => {
        for (var i = 0; i < cantJugadores; i++) {
            var nombre = res.data.results[i].name.first + res.data.results[i].name.last;
            var picture = res.data.results[i].picture.medium;
            var queryPlayers = 'INSERT INTO psh_players (nickname, pfp) VALUES ( "' + nombre + '", "' + picture + '")'
            db.query(queryPlayers);

            var idPlayer;
            db.query('SELECT * FROM psh_players ORDER BY id_player DESC LIMIT 1', function (err, result) {
                if (err) throw err;
                idPlayer = result[0].id_player;
                var score = parseInt(Math.random() * 100);

                var queryStats = 'INSERT INTO psh_game (id_player, score) VALUES ("' + idPlayer + '", "' + score + '")';
                db.query(queryStats);
            });
        }
    }).catch(err => console.log(err))
});