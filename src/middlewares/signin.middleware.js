import { getUserByEmailDB } from "../repository/signup.repository.js";
import bcrypt from 'bcrypt'

export async function validateSignin(req,res,next){
    const {email, password} = req.body;

    try {
        const user = await getUserByEmailDB(email)
        if (user.rowCount === 0) return res.status(401).send({message: "Dados invalidos"});
        
        if(!bcrypt.compareSync(password, user.rows[0].password)) return res.status(401).send({message: "Dados invalidos"});

        res.locals.userId = user.rows[0].id

        next()

    } catch (error) {
        res.status(500).send(error.message)
    }
}