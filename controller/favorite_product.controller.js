const db = require('../db')

class favorite_productController {

    async getFavoriteProduct(req,res) {
        const id = req.query.id
        const result = await db.query('SELECT * from favorites_product')
        res.json(result.rows[0])
    }

    async createFavoriteProduct(req, res) {
        const {favorites_id, product_id} = req.body
        const result = await db.query('INSERT into favorites_product(favorites_id, product_id) values ($1, $2) RETURNING *', [favorites_id, product_id])
        res.json(result.rows[0])
    }
    async deleteFavoriteProduct(req,res) {
        const id = req.query.id
        const result = await db.query('DELETE from favorites_product WHERE favorites_id=$1', [id])
        res.json(result.rows[0])
    }


}

module.exports = new favorite_productController()