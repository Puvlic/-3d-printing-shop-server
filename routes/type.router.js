const Router = require("express");
const router = Router.Router()
const userController = require('../controller/type.controller')

router.route('/type')
    .post(userController.createType)
    .delete(userController.deleteType)
    .get(userController.getTypes)

router.route('/type/:id')

module.exports = router