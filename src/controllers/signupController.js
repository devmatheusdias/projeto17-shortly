import { createUserDB } from '../repository/signup.repository.js'

export async function Signup(req, res) {

    try {
        await createUserDB(req.body);
        res.sendStatus(201)
    } catch (error) {
        res.status(500).send(error.message)
    }
}
