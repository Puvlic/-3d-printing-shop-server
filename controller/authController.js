const db = require('../db')
const bcrypt = require('bcryptjs')
const jwt = require("jsonwebtoken")
const {validationResult} = require('express-validator')
const {secret} = require('../config')



const generateAccessToken = (id, roles, username) => {
    const payload = {
        id,
        roles,
        username
    }
    return jwt.sign(payload, secret, {expiresIn: "24h"})
}

class authController {
    async registration(req, res) {
        try {
            const errors = validationResult(req)
            if(!errors.isEmpty()) {
                return res.status(400).json({message: 'Ошибка при регистрации', errors});
            }
            const users = await db.query('SELECT username from p_user')
            console.log(users.rows)
            const {username, password, name, surname, email} = req.body
            if (users.rows !== undefined){
                let candidate = ""
                for (let i = 0; i < users.rows.length; i++) {
                    if (users.rows[i].username === username) {
                        candidate = username
                        break
                    }
                }
                if(candidate) {
                    return res.status(400).json({message: 'Пользователь с таким именем уже существует'});
                }
            }
            const hashPassword = bcrypt.hashSync(password, 7);
            const userRole = 1 // USER
            const user = await db.query('INSERT INTO p_user (name, surname, username, password, email, role) values ($1, $2, $3, $4, $5, $6) RETURNING *', [name, surname, username, hashPassword, email, userRole])
            return res.json({message: "Пользователь зарегистрирован"})
        } catch (e) {
            console.log(e)
            res.status(400).json({message: 'Registration error'})
        }
    }
    async login(req, res) {
        res.setHeader('Access-Control-Allow-Origin', '*');
        try {
            const {username, password} = req.body
            const users = await db.query('SELECT * from p_user')
            let user = ''
            console.log(users.rows)
            for (let i = 0; i < users.rows.length; i++) {
                if (users.rows[i].username === username){
                    user = users.rows[i];
                    break
                }
            }

            if (!user) {
                return res.status(400).json({message: 'Пользователя с таким именем не существует'});
            }

            const validPassword = bcrypt.compareSync(password, user.password)

            if (!validPassword) {
                return res.status(400).json({message: 'Введен неверный пароль'})
            }

            const token = generateAccessToken(user.id, user.role, user.username)

            return res.json({
                token,
                user: {
                    user_id: user.id,
                    username: user.username,
                    name: user.name,
                    surname: user.name,
                }
            })

        } catch (e) {
            console.log(e)
            res.status(400).json({message: 'Login error'})
        }
    }
    async getUser(req, res) {
        const id = req.params.id
        const user = await db.query('SELECT * from p_user WHERE id = $1', [id])
        res.json(user.rows)
    }
    async getUsers(req, res) {
        const users = await db.query('SELECT * from p_user')
        res.json(users.rows)
    }
    async deleteUser(req,res) {
        const id = req.query.id
        const user = await db.query('DELETE from p_user WHERE id=$1', [id])
        res.json('Удаление выполнено: ' + id)
    }
}

module.exports = new authController()