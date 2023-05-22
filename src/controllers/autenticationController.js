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
        await db.query(`
            INSERT INTO users (name, email, password)
                VALUES ($1, $2, $3);
        `, [name, email, encryptedPass]);
        res.sendStatus(201);
    } catch (erro){
        res.send(erro.message)
    }
}

export async function loginAccount(req, res) {
    const {email, password} = req.body;
    try{
        const account = await db.query(`
        SELECT email, password
            FROM users
                Where email = $1 OR password = $2;
        `, [email, password]);
        if(!account.rows[0]){
            return res.sendStatus(401);
        } else {
            const passwordValidation = bcrypt.compareSync(password, account.rows[0].password);
            if(!passwordValidation) return res.sendStatus(401);
        }
        const token = uuid();
        const login = await db.query(`
        UPDATE users
            SET token = $1
                Where email = $2;
        `, [token, email]);
        res.status(200).send({token});
    } catch (erro){
        res.send(erro.message)
    }
}