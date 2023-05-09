const db = require('../db')

class productController {
    async createProduct(req,res) {
        const {name, type, price, count, img, aboutproduct} = req.body
        const newPerson = await db.query('INSERT INTO product (name, type, price, count, img, aboutproduct) values ($1, $2, $3, $4, $5, $6) RETURNING *', [name, type, price, count, img, aboutproduct])
        console.log(name, type, price, count, img, aboutproduct)
        res.json(newPerson.rows[0])
    }
    async getProducts(req, res) {
        res.header("Access-Control-Allow-Origin", "*");
        res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
        const users = await db.query('SELECT * from product')
        res.json(users.rows)
    }

    async getOneProduct(req, res) {
        const id = Number (req.params.id)
        const user = await db.query('SELECT * from product WHERE id = $1', [id])
        res.json(user.rows[0])
    }

    async updateProduct(req, res) {
        const {id, name, type, price, count, img, aboutproduct} = req.body
        const user = await db.query(
            'UPDATE product set name = $1, type = $2, price = $3, count=$4, img = $5, aboutproduct = $6 WHERE id = $7 RETURNING *',
            [name, type, price, count, img, aboutproduct, id]
        )
        res.json(user.rows[0])
    }

    async deleteProduct(req, res) {
        const id = req.params.id
        const user = await db.query('DELETE from product WHERE id = $1', [id])
        res.json(user.rows[0])
    }
}

module.exports = new productController()