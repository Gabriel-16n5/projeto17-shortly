import { db } from "../database/database.connection.js";

export async function getRanking(req, res) {
    try{

        res.send("oi");
    } catch (erro){
        res.send(erro.message)
    }
}