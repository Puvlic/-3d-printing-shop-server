const Router = require("express");
const router = Router.Router()
const controller = require('../controller/authController')
const {check} = require('express-validator')
const userController = require("../controller/cart.controller");

router.post('/registration',
    [
        check('name', 'Имя не может быть пустым').notEmpty(),
        check('name', 'Имя должно быть больше 2 и меньше 20 символов').isLength({min:2, max:20}),
        check('surname', 'Фамилия не может быть пустой').notEmpty(),
        check('surname', 'Фамилия должна быть больше 2 и меньше 20 символов').isLength({min:2, max:20}),
        check('username', 'Имя пользователя не может быть пустым').notEmpty(),
        check('password', 'Пароль должен быть больше 6 и меньше 20 символов').isLength({min:4, max:20})
    ],
    controller.registration)
router.post('/login', controller.login)
router.get('/users', controller.getUsers)
router.delete('/user_delete', controller.deleteUser)
router.route('/user/:id')
    .get(controller.getUser)

module.exports = router