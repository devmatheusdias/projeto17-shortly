import { db } from '../database/database.connection.js';


export async function createUserDB(body){
    const {name, email, password} = body;

    const result = await db.query(`
        INSERT INTO users (name, email, password)
            VALUES ($1, $2, $3);`,
            [name, email, password])
 
    return result
}

export function getUserByEmailDB(email){
    const result = db.query(`SELECT * FROM users WHERE email=$1;`, [email])
    return result;
}