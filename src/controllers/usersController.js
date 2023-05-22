import { db } from "../database/database.connection.js";

export async function getusers(req, res) {
    const {authorization} = req.headers;
    const token = authorization?.replace('Bearer ', '');
    let visitCount = 0;
    if(!token) return res.status(401).send("Unauthorized access");
    try{
        const session = await db.query(`
        SELECT * 
            FROM users WHERE token = $1;
        `, [token]);
        const id = session.rows[0].id
        if(!session.rows[0]) return res.sendStatus(401);

        const shortenedUrls = await db.query(`
        SELECT id, "shortUrls" AS "shortUrl", "urlsBase" AS "url", "visitCount"
            FROM urls WHERE "userId" = $1;
        `, [id]);
        for (let i = 0; i<shortenedUrls.rowCount; i++){
            visitCount+= shortenedUrls.rows[i].visitCount;
        }
        const data = {
            id,
            name: session.rows[0].name,
            visitCount,
            shortenedUrls: shortenedUrls.rows

        }
        res.status(200).send(data);
    } catch (erro){
        res.send(erro.message)
    }
}