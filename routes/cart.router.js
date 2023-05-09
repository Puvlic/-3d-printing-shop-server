const Router = require("express");
const router = Router.Router()
const userController = require('../controller/cart.controller')

router.route('/cart')
    .post(userController.createCart)
    .get(userController.getCarts)
    .delete(userController.deleteCart)

router.route('/cart/count_increase/:id')
    .put(userController.increaseProductCount)


router.route('/cart/count_decrease/:id')
    .put(userController.decreaseProductCount)

router.route('/cart/:id')
    .get(userController.getCartProducts)

router.route('/cart/new/:id')
    .get(userController.getCartByUser)

router.route('/cart/deleteAll')
    .delete(userController.deleteAllCarts)

module.exports = router

