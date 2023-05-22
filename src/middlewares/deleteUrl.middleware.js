import { getUrls } from "../repository/deleteUrl.repository.js";

export async function deleteUrl(req, res, next) {
    const {id} = req.params
    
    try {

        const urls = await getUrls(id);
        if (urls.rowCount === 0) return res.status(404).send({ message: "Url não encontrada" });

        next()

    } catch (error) {
        res.status(500).send(error.message)
    }
}