import { db } from "../database/database.connection.js";
import { nanoid } from "nanoid";

export async function createShortenUrl(req, res) {
    const {url} = req.body;
    console.log(url);
    const {authorization} = req.headers;
    if(!authorization) return res.status(401).send("Unauthorized access");
    const shortUrl = nanoid(8);
    try{
        const session = await db.query(`
        SELECT token, id
            FROM users WHERE token = $1;
        `, [authorization]);
        if(!session.rows[0]) return res.send(401);

        await db.query(`
        INSERT INTO url("userId", "urlBase") VALUES ($1, $2);
    `, [session.rows[0].id, url]);

        await db.query(`
        INSERT INTO "shortUrl"("userId", "shortUrlDone") VALUES ($1, $2);
    `, [session.rows[0].id, shortUrl]);

        const body= await db.query(`
        SELECT id, "shortUrlDone" FROM "shortUrl" WHERE "userId" = $1;
        `, [session.rows[0].id]);
        res.status(201).send(body.rows.at(-1));
    } catch (erro){
        res.send(erro.message)
    }
}

export async function getUrlId(req, res) {
    try{

        res.send("oi");
    } catch (erro){
        res.send(erro.message)
    }
}

export async function getUrl(req, res) {
    try{

        res.send("oi");
    } catch (erro){
        res.send(erro.message)
    }
}

export async function deleteUrl(req, res) {
    try{

        res.send("oi");
    } catch (erro){
        res.send(erro.message)
    }
}