import {getRankingDB} from '../repository/rankings.repository.js'

export async function getRanking(req, res){
    try {
        const result = await getRankingDB();
        res.status(201).send(result.rows)
        
    } catch (error) {
        res.send(error.message)
    }
}
