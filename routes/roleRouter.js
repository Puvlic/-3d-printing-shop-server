const Router = require("express");
const router = Router.Router()
const controller = require('../controller/roleController')

router.route('/role')
    .post(controller.createRole)
    .get(controller.getRole)

router.route('/role/:id')
    .delete(controller.deleteRole)


module.exports = router