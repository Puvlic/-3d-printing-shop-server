const dotenv = require('dotenv')
const nodemailer = require('nodemailer')


dotenv.config()

const { EMAIL_HOST, EMAIL_HOST_PASSWORD, EMAIL_HOST_USER, EMAIL_PORT } = process.env

class Mail {
    #transporter = null

    constructor() {
        this.#transporter = this.#getTransporter()
    }

    #getTransporter() {
        return nodemailer.createTransport({
            host: "smtp.mail.ru",
            port: 465,
            secure: false,
            auth: {
                user: "plastictoys1234@mail.ru",
                pass: "s1j0hzu4GLxTYGxdQjkx",
            }
        })
    }

    async send(reciever, message) {
        try{
            const info = await this.#transporter.sendMail({
                from: 'plastictoys1234@gmail.com',
                to: reciever,
                subject: 'Заказ товара',
                text: message,
                // html: `<b>${message}<b/>`
            })
            return info.messageId
        }catch (e){
            return(e)
        }
    }
}

module.exports = new Mail()