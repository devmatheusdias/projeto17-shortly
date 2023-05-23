import { getUsersDB } from "../repository/users.repository.js"

export async function getUsers(req, res){
    try {
        const result = await getUsersDB(res.locals.token)
        res.status(201).send(result)
    } catch (error) {
        res.send(error.message)
    }
}
