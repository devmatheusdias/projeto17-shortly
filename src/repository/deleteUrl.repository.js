import { db } from '../database/database.connection.js';

export async function getUrls(id){
    const result = await  db.query(`SELECT * FROM urls WHERE id=$1;`, [id])
    return result
}


