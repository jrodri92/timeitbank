const express = require('express');
const app = express();
const path = require('path');
const morgan = require('morgan');
const mysql = require('mysql');
const myConnection = require('express-myconnection');
// settings
app.set('port', process.env.PORT || 3000);
app.set('view engine', 'ejs')
app.set('views', path.join(__dirname,'views'))

//middlewares
app.use(morgan('dev'));
app.use(myConnection(mysql, {
    host: 'localhost',
    user: 'root',
    password: '',
    port: 3306,
    database: 'timeitBank'
}, 'single'));
//routes

app.listen(app.get('port'), ()=> {
    console.log('Server on port 3000')
})