const db = require('../db')

class cartController {
    async createCart(req, res) {
        const {user_id, product_id} = req.body
        const newCart = await db.query('INSERT INTO cart (user_id, product_id, count) values ($1, $2, $3) RETURNING *', [user_id, product_id, 1])
        res.json(newCart.rows)
    }
    async getCartByUser(req, res) {
        const id = Number(req.params.id)
        const cart = await db.query('SELECT * from cart WHERE user_id = $1', [id])
        res.json(cart.rows)
    }
    async getCartProducts(req, res) {
        const id = Number (req.params.id)
        const users = await db.query('SELECT * from cart, product WHERE cart.user_id = ($1) and product.id = cart.product_id', [id])
        res.json(users.rows)
    }
    async getCarts(req, res) {
        const carts = await db.query('SELECT * from cart')
        res.json(carts.rows)
    }
    async increaseProductCount(req, res) {
        const id = Number(req.params.id)
        const cart = await db.query('UPDATE cart SET count = count + 1 WHERE id = ($1)', [id])
        res.json(cart.rows[0])
    }
    async decreaseProductCount(req, res) {
        const id = Number(req.params.id)
        const cart = await db.query('UPDATE cart SET count = count - 1 WHERE id = ($1)', [id])
        res.json(cart.rows)
    }
    async deleteAllCarts(req, res) {
        const cart = await db.query('DELETE from cart')
        res.json(cart.rows)
    }
    async deleteCart(req, res) {
        const {user_id, product_id} = req.body
        const cart = await db.query('DELETE from cart WHERE user_id = $1 and product_id = $2' , [user_id, product_id])
        res.json(cart.rows[0])
    }
}

module.exports = new cartController();