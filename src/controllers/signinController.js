import {createSessionDB} from "../repository/signin.repository.js"

export async function Signin(req, res){
    try {
        const token = await createSessionDB(req.body, res.locals.userId);
        res.status(201).send({token: token})
    } catch (error) {
        res.status(500).send(error.message)
    }
}
