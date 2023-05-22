import { db } from "../database/database.connection.js";
import { nanoid } from "nanoid";

export async function createShortenUrl(req, res) {
    const { url } = req.body;
    const { authorization } = req.headers;
    const token = authorization?.replace('Bearer ', '');
    if(!token) return res.sendStatus(401);
    const shortUrl = nanoid(8);
    try{
        const session = await db.query(`
        SELECT token, id
            FROM users WHERE token = $1;
        `, [token]);
        if(!session.rows[0]) return res.sendStatus(401);

        await db.query(`
        INSERT INTO url("userId", "urlBase") VALUES ($1, $2);
    `, [session.rows[0].id, url]);

        await db.query(`
        INSERT INTO "shortUrl"("userId", "shortUrlDone") VALUES ($1, $2);
    `, [session.rows[0].id, shortUrl]);

        const body = await db.query(`
        SELECT id, "shortUrlDone" FROM "shortUrl" WHERE "userId" = $1;
        `, [session.rows[0].id]);

        await db.query(`
        INSERT INTO urls("userId", "urlsBase", "shortUrls") VALUES ($1, $2, $3);
    `, [session.rows[0].id, url, shortUrl]);
        const data = {
            id: body.rows.at(-1).id,
            shortUrl
        }
        res.status(201).send(data);
    } catch (erro){
        res.send(erro.message)
    }
}

export async function getUrlId(req, res) {
    const {id} = req.params;
    try{
        const geturl = await db.query(`
            SELECT id, "shortUrls", "urlsBase"
                FROM urls WHERE id = $1;
        `, [id]);
    if(geturl.rows[0] === undefined) return res.sendStatus(404);
    const data = {
        id: geturl.rows[0].id,
        shortUrl: geturl.rows[0].shortUrls,
        url: geturl.rows[0].urlsBase
    }
        res.status(200).send(data);
    } catch (erro){
        res.send(erro.message)
    }
}

export async function getUrl(req, res) {
    const {shortUrl} = req.params;
    console.log(shortUrl);
    try{
        const geturl = await db.query(`
            SELECT id, "shortUrls", "urlsBase", "visitCount"
                FROM urls WHERE "shortUrls" = $1;
        `, [shortUrl]);
    if(geturl.rows[0] === undefined) return res.sendStatus(404);
    await db.query(`
      UPDATE urls
        SET "visitCount" = $1
            Where "shortUrls" = $2;
    `, [geturl.rows[0].visitCount+1, shortUrl]);
     res.redirect(geturl.rows[0].urlsBase);
    } catch (erro){
        res.send(erro.message)
    }
}

export async function deleteUrl(req, res) {
    const {id} = req.params;
    const {authorization} = req.headers;
    const token = authorization?.replace('Bearer ', '');
    if(!token) return res.status(401).send("Unauthorized access");
    try{
        const session = await db.query(`
        SELECT token, id
            FROM users WHERE token = $1;
        `, [token]);
        if(!session.rows[0]) return res.sendStatus(401);

        const urlValidation = await db.query(`
        SELECT "userId"
            FROM urls WHERE id = $1 AND "userId" = $2;
        `, [id, session.rows[0].id]);
        if(!urlValidation.rows[0]) return res.sendStatus(401);
        if(session.rows[0].id === urlValidation.rows[0].userId){
            await db.query(`
            DELETE 
                FROM urls
                    WHERE id = $1;
            `, [id]);
            res.sendStatus(204);
        }
    } catch (erro){
        res.send(erro.message)
    }
}