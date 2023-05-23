import { db } from '../database/database.connection.js';

export async function getUsersDB(token){


    const session = await db.query(`
        SELECT * FROM sessions WHERE token=$1;`, [token]
    )

    


    return session.rows[0]
}