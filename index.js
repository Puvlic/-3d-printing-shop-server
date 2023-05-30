
const path = require('path')
const db = require('./db')
const fs = require('fs');

const bodyParser = require('body-parser')
const express = require('express')
const roleRouter = require('./routes/roleRouter')
const productRouter = require('./routes/product.router')
const cartRouter = require('./routes/cart.router')
const cart_productRouter = require('./routes/cart_product.router')
const favorites = require('./routes/favorites.router')
const favorite_productRouter = require('./routes/favorite_product.router')
const typeRouter = require('./routes/type.router')
const authRouter = require('./routes/authRouter')
const getOrdersRouter = require('./routes/ordersRouter')
const maketRouter = require('./routes/maketRouter')
// process.env.PORT ||
const PORT = 8080
const cors = require('cors')

const app = express()

const http = require("http").createServer(app)
const socketIO = require('socket.io') (http, {
    cors: {
        origin: "*"
    }
})


app.use(cors())


app.get('/hello', function (req, res) {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'POST, GET, OPTIONS, PUT, DELETE');
    res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
    res.header('ngrok-skip-browser-warning', true);

    res.send('Hello World');
})
app.use(express.json())
app.use('/files', express.static(path.join(__dirname, 'files')))
app.use('/api', roleRouter)
app.use('/api', productRouter)
app.use('/api', cartRouter)
app.use('/api', cart_productRouter)
app.use('/api', favorites)
app.use('/api', favorite_productRouter)
app.use('/api', typeRouter)
app.use('/api', authRouter)
app.use('/api', getOrdersRouter)
app.use('/api', require('./routes/uploadRouter'))
app.use('/api', maketRouter)

// app.get('/mail_get', (req, res) => res.send(`Requested from ${req.hostname} <h1>Hello World</h1>`))

app.get('/download/:id', async (req, res) => {
    const id = req.params.id
    const url = await db.query("SELECT file_url from makets WHERE id = $1", [id])
    console.log(path.join(__dirname, url.rows[0].file_url), url.rows[0].file_url.split('\\').pop())
    res.download(path.join(__dirname, url.rows[0].file_url))
} )

app.post('/mail_send', async (req, res) => {
    const {email, message} = req.body
    return res.json({result: await Mail.send(email, message)})
})

app.delete('/delete/:id', async (req, res) => {
    const id = req.params.id
    const filePath = await db.query("SELECT file_url from makets WHERE id = $1", [id])
    console.log(path.join(__dirname, filePath.rows[0].file_url))
    fs.unlink(filePath.rows[0].file_url, err => {
        if (err) {
            console.error(err);
            return;
        }
    })
    const removeFile = await db.query('DELETE from makets WHERE id = $1', [id])
    res.json(removeFile)
})

// app.get('/download/:id', async (req, res) => {
//     const id = req.params.id
//     const path = await db.query("SELECT file_url from makets WHERE id = $1", [id])
//     const file = `${__dirname}/${path.rows[0].file_url}`;
//     res.download(file);
// })

try {
    app.listen(PORT, () => console.log('server started on port ' + PORT))
} catch (e) {
    console.log(e)
}
