const db = require('../db')

class typeController {
    async createType(req, res) {
        const {type} = req.body
        const result = await db.query('INSERT into type(type) values ($1) RETURNING *', [type])
        res.json(result.rows[0])
    }

    async deleteType(req,res) {
        const id = req.query.id
        const result = await db.query('DELETE from type WHERE id=$1', [id])
        res.json(result.rows[0])
    }

    async changeType(req, res) {
        const id = req.query.id
        const result = await db.query('')
    }

    async getTypes(req,res) {
        res.header("Access-Control-Allow-Origin", "*");
        const result = await db.query('SELECT * from type')
        res.json(result.rows)
    }
}

module.exports = new typeController()