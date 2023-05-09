const Router = require("express");
const router = Router.Router()
const userController = require('../controller/product.controller')

router.route('/product')
    .get(userController.getProducts)
    .post(userController.createProduct)
    .put(userController.updateProduct)

router.route('/product/:id')
    .get(userController.getOneProduct)
    .delete(userController.deleteProduct)


module.exports = router