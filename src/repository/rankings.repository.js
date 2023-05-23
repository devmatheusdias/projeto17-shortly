import { db } from '../database/database.connection.js';

export async function getRankingDB() {

    const result = await db.query(`
        SELECT u.id, u.name, COUNT(url.userId) AS linksCount, SUM(url.views) AS visitCount
        FROM users u
        LEFT JOIN urls url ON u.id = url.userId
        GROUP BY u.id, u.name;
    `)

    return result
}
