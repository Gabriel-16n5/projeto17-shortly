import { db } from "../database/database.connection.js";

export async function getRanking(req, res) {
    try{
        const shortenedUrls = await db.query(`
        SELECT url."userId" AS id, users.name, COUNT(urls."shortUrls") AS "linksCount", urls."visitCount"
        FROM urls
        JOIN users ON users.id = urls."userId"
        JOIN url ON url."userId" = urls."userId"
        GROUP BY url."userId", users.name, urls."visitCount"
        ORDER BY "linksCount"
        LIMIT 10
        ;
        `,);
        res.send(shortenedUrls.rows);
    } catch (erro){
        res.send(erro.message)
    }
}



// const shortenedUrls = await db.query(`
// SELECT "userId" AS id, "urlsBase" AS "linksCount", "visitCount"
//     FROM urls
//     ORDER BY "visitCount";
// `,);


// SELECT user.name, COUNT(*) AS "linksCount"
// FROM urls
// JOIN user ON user.id = urls."userId"
// GROUP BY user.name
// ORDER BY "linksCount";