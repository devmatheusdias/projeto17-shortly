import { db } from '../database/database.connection.js';
import { nanoid } from "nanoid"

export async function postUrl(body, res) {
    const { url } = body;

    const id = nanoid(6);

    const session = await db.query(`
        SELECT * FROM sessions WHERE token=$1;`, [res]
    )

    await db.query(`
        INSERT INTO urls (url, shorturl, userid)
            VALUES ($1, $2, $3);`,
        [url, id, session.rows[0].userId]
    )

    const link = await db.query(`
        SELECT * FROM urls WHERE shorturl=$1;`, [id]
    )

    return {id: link.rows[0].id, shortUrl: id}
}

export async function getUrlId(params) {
    const {id} = params

    const url = await db.query(`
        SELECT urls.id, urls.shorturl, urls.url FROM urls WHERE id=$1;`, [id]
    )

    return url.rows[0];
}

export async function getShortUrl(params) {
    const shorturl = params;

    const url = await db.query(`
        UPDATE urls SET views = views + 1 WHERE shorturl=$1;`,[shorturl]
    )

    return url;
}

export async function deleteUrl(params, res) {

    const id = Number(params);

    const user = await db.query(`
     SELECT sessions."userId" FROM sessions WHERE token=$1;`, [res]
    )

    const userId = Number(user.rows[0].userId)

    const urls = await db.query(`
        SELECT * FROM urls WHERE id=$1 AND "userId"=$2;`, [id, userId])

    return urls
}

