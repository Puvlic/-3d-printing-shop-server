const db = require('../db')
const path = require('path');

class maketController {
    async createNewMaket (req, res)  {
        const {user_id, file_url, price, status, accept_status, original_file_name, address} = req.body
        const newMaket = await db.query('INSERT into makets (user_id, file_url, price, status, accept_status, original_file_name, address) values ($1, $2, $3, $4, $5, $6, $7) RETURNING *', [user_id, file_url, price, status, accept_status, original_file_name])
        res.json(newMaket.rows)
    }
    async getNotAcceptedMakets (req, res) {
        const makets = await db.query('SELECT * from makets WHERE accept_status = 1')
        res.json(makets.rows)
    }
    async getAcceptedMaketsByUser (req, res) {
        const user_id = req.params.id
        const makets = await db.query('SELECT * from makets WHERE accept_status = 2 and user_id = $1', [user_id])
        res.json(makets.rows)
    }

    async getMaketsByUser (req, res) {
        const id = req.params.id
        const makets = await db.query('SELECT * from makets WHERE accept_status = 3 and user_id = $1', [id])
        res.json(makets.rows)
    }
    async getMaket (req, res) {
        const id = req.params.id
        const maket = await db.query('SELECT * from makets WHERE id = $1', [id])
        res.json(maket.rows[0])
    }
    async acceptMaket (req, res) {
        const {id, price} = req.body
        const maket = await db.query("UPDATE makets set price = $2, status='Принят', accept_status = 2 WHERE id = $1 RETURNING *", [id, price])
        res.json(maket)
    }
    async acceptOrder (req, res) {
        const id = req.params.id
        const maket = await db.query("UPDATE makets set status='Принят на печатанье', accept_status = 3 WHERE id = $1 RETURNING *", [id])
        res.json(maket)
    }
    async discountRequest (req, res) {
        const id = req.params.id
        const maket = await db.query("UPDATE makets set status='Запрос на скидку', accept_status = 1 WHERE id = $1 RETURNING *", [id])
        res.json(maket)
    }
}

module.exports = new maketController()