const db = require('../db')

class ordersController {
    async createOrder(req, res) {
        const {count, user_id, product_id, status, address} = req.body
        const newOrder = await db.query('INSERT INTO orders (count, user_id, product_id, status, address) values ($1, $2, $3, $4, $5) RETURNING *', [count, user_id, product_id, status, address])
        res.json(newOrder.rows)
    }
    async getAllOrders(req, res) {
        const orders = await db.query('SELECT * from orders')
        res.json(orders.rows)
    }
    async getOrdersByUser(req, res) {
        const user_id = Number (req.params.id)
        const orders = await db.query('SELECT * from orders where user_id = $1', [user_id])
        res.json(orders.rows)
    }
    async getOrdersById(req, res) {
        const id = Number (req.params.id)
        const orders = await db.query('SELECT * from orders where id = $1', [id])
        res.json(orders.rows[0])
    }
    async updateOrderStatus(req, res) {
        const {status, id} = req.body
        const user = await db.query('UPDATE orders set status = $1 WHERE id = $2 RETURNING *', [status, id])
        res.json(user.rows[0])
    }

    async closeOrder(req, res) {
        const id = req.params.id
        const path = await db.query("SELECT file_url from makets WHERE id = $1", [id])
        const user = await db.query('DELETE from orders WHERE id = $1', [id])
        res.json(user.rows[0])
    }
    async updateProduct(req, res) {
        const {count, user_id, product_id, status, address, id} = req.body
        const user = await db.query(
            'UPDATE orders set count = $1, user_id = $2, product_id = $3, status=$4, address = $5 WHERE id = $6 RETURNING *',
            [count, user_id, product_id, status, address, id]
        )
        res.json(user.rows[0])
    }
}

module.exports = new ordersController()
