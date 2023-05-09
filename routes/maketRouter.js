const Router = require("express");
const router = Router.Router()
const userController = require('../controller/maketController')

router.route('/maket')
    .get(userController.getNotAcceptedMakets)
    .post(userController.createNewMaket)
    .put(userController.acceptMaket)

router.route('/maket/:id')
    .get(userController.getAcceptedMaketsByUser)

router.route('/maket/byUser/:id')
    .get(userController.getMaketsByUser)

router.route('/maket/byId/:id')
    .get(userController.getMaket)

router.route('/maket/discount/:id')
    .put(userController.discountRequest)

router.route('/maket/accept/:id')
    .put(userController.acceptOrder)


module.exports = router
