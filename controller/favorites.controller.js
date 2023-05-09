const db = require('../db')

class favoritesController {
    async createFavorites(req, res) {
        const {user_id, product_id} = req.body
        const newCart = await db.query('INSERT INTO favorites (user_id, product_id) values ($1, $2) RETURNING *', [user_id, product_id])
        res.json(newCart.rows[0])
    }
    async getFavoritesByUser(req, res) {
        const id = req.params.id
        const favorites = await db.query('SELECT * from favorites WHERE user_id = $1', [id])
        res.json(favorites.rows)
    }
    async getFavorites(req, res) {
        const favorites = await  db.query('SELECT * from favorites')
        res.json(favorites.rows)
    }
    async deleteFavorites(req, res) {
        const {user_id, product_id} = req.body
        const favorites = await db.query('DELETE from favorites WHERE user_id = $1 and product_id = $2' , [user_id, product_id])
        res.json(favorites.rows)
    }
    // async deleteAllFavorites(req, res) {
    //     const favorites = await db.query('DELETE from favorites')
    //     res.json(favorites.rows)
    // }

}


module.exports = new favoritesController();