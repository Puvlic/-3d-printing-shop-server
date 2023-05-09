const {Router} = require('express')
const upload = require('../controller/fileController')

const router = Router()

router.post('/upload', upload.single('stlFile') ,(req, res) => {
    try {
        if (req.file) {
            res.json(req.file)
        }
    } catch (e) {
        console.log(e)
    }
})

module.exports = router