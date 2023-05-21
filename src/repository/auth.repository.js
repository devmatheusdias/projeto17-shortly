import { db } from '../database/database.connection.js';

export async function getToken(token){

    const result = db.query(`SELECT * FROM sessions WHERE token=$1;`, [token])
    return result;
}


