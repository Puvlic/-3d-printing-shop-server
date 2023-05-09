const Router = require("express");
const router = Router.Router()
const userController = require('../controller/favorites.controller')

router.route('/favorites')
    .post(userController.createFavorites)
    .get(userController.getFavorites)
    .delete(userController.deleteFavorites)

router.route('/favorites/:id')
    .get(userController.getFavoritesByUser)
    .delete(userController.deleteFavorites)


module.exports = router