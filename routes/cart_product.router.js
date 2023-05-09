const Router = require("express");
const router = Router.Router()
const userController = require('../controller/cart_product.controller')

router.route('/cart_product')
    .post(userController.createCartProduct)
    .get(userController.getCartProduct)
    .delete(userController.deleteCartProduct)

module.exports = router