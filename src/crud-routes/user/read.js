const express = require("express");

const readUser = express.Router(); 
const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient(); 

/*
    Read route for user table
*/
// /user/:klayvemguik@gmail.com 

readUser.get("/user/:userEmail", async (req,res) => {
    const {userEmail} = req.params;

    try{
        const user = await prisma.tbusuario.findFirst({
                where:{
                    email_usuario : userEmail,
                }
            });
            return res.status(200).json(user);
    }catch(error){console.log(error)}
});

// readUser.get("/user", async (req,res) => {
//     try{
//         const users = await prisma.user.findMany();
//         return res.status(200).json(users);
//     }catch(error){ console.error(error) }
// });

module.exports = readUser;