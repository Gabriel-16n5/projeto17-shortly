import { db } from "../database/database.connection.js";
import bcrypt from "bcrypt";
import { v4 as uuid } from "uuid";

export async function createAccount(req, res) {
    const {name, email, password, confirmPassword} = req.body;
    if(password !== confirmPassword) return res.sendStatus(422);
    try{
        const account = await db.query(`
        SELECT email, name
            FROM users
                Where email = $1 OR name = $2;
        `, [email, name]);
        if(!account.rows[0]){

        }else {
            if(account.rows[0].email === email || account.rows[0].name === name) return res.sendStatus(409);
        }
        
        const encryptedPass = (bcrypt.hashSync(password, 10));
        const dbCheck = await db.query(`
            INSERT INTO users (name, email, password)
                VALUES ($1, $2, $3);
        `, [name, email, encryptedPass])
        res.sendStatus(201);
    } catch (erro){
        res.send(erro.message)
    }
}

export async function loginAccount(req, res) {
    try{

        res.send("oi");
    } catch (erro){
        res.send(erro.message)
    }
}