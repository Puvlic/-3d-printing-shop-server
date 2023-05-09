const db = require('../db')

class authController {
    async createRole (req,res) {
        const {value} = req.body
        const result = await db.query('INSERT INTO role (value) values ($1) RETURNING *', [value])
        res.json(result.rows[0])
    }
    async deleteRole (req,res) {
        const id = req.params.id
        const result = await db.query('DELETE from role WHERE id = $1', [id])
        res.json(result.rows[0])
    }
    async getRole(req, res) {
        const roles = await  db.query('SELECT * from role')
        res.json(roles.rows)
    }
}

module.exports = new authController()