import { db } from '../database/database.connection.js';


export async function createUserDB(body){
    const {name, email, password, confirmPassword} = req.body;

    const result = await db.query(`
        INSERT INTO users (name, email, password, confirmPassword)
            VALUES ($1, $2, $3, $4,);`
            [name, email, password, confirmPassword]
    )

    return result
}

export function getUserByEmailDB(email){
    const result = db.query(`SELECT * FROM users WHERE email=$1;`, [email])
    return result;
}