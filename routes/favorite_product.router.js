const Router = require("express");
const router = Router.Router()
const userController = require('../controller/favorite_product.controller')

router.route('/favorites_product')
    .post(userController.createFavoriteProduct)
    .get(userController.getFavoriteProduct)
    .delete(userController.deleteFavoriteProduct)

module.exports = router