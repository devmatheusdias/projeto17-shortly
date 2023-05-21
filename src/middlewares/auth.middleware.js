import { getToken } from "../repository/auth.repository.js";

export async function authValidade(req, res, next) {
    const { authorization } = req.headers;
    
    const token = authorization?.replace('Bearer', '').trim();

    try {

        if (!token) return res.status(401).send('Unauthorized')

        const session = await getToken(token)

        if (session.rowCount === 0) return res.status(401).send({ message: "Unauthorized" });

        res.locals.token = session.rows[0].token

        next()

    } catch (error) {
        res.status(500).send(error.message)
    }
}