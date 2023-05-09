const Router = require("express");
const router = Router.Router()
const userController = require('../controller/ordersController')

router.route('/order')
    .get(userController.getAllOrders)
    .post(userController.createOrder)
    .put(userController.updateOrderStatus)

router.route('/order/:id')
    .get(userController.getOrdersByUser)
    .delete(userController.closeOrder)
    .put(userController.updateProduct)

router.route('/order/byId/:id')
    .get(userController.getOrdersById)

module.exports = router