const db = require('../db')

class cart_productController {

    async getCartProduct(req,res) {
        const id = req.query.id
        const result = await db.query('SELECT * from cart_product')
        res.json(result.rows[0])
    }

    async createCartProduct(req, res) {
        const {cart_id, product_id} = req.body
        const result = await db.query('INSERT into cart_product(cart_id, product_id) values ($1, $2) RETURNING *', [cart_id, product_id])
        res.json(result.rows[0])
    }

    async deleteCartProduct(req,res) {
        const id = req.query.id
        const result = await db.query('DELETE from cart_product WHERE cart_id=$1', [id])
        res.json(result.rows[0])
    }
}

module.exports = new cart_productController()