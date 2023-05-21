import { getUserByEmailDB } from "../repository/signup.repository.js";

export async function validateSignup(req,res,next){
    const {email} = req.body;

    try {
        const user = await getUserByEmailDB(email)
        if (user.rowCount !== 0) return res.status(409).send({message: "Esse email ja está cadastrado"});
        next()

    } catch (error) {
        res.status(500).send(error.message)
    }
}