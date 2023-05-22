import { db } from "../database/database.connection.js";

export async function getRanking(req, res) {
    try{
        const shortenedUrls = await db.query(`
        SELECT id, "shortUrls", "urlsBase", "visitCount"
            FROM urls;
        `,);
        res.send(shortenedUrls.rows);
    } catch (erro){
        res.send(erro.message)
    }
}