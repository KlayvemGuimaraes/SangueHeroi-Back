#npm run dev
#npx prisma studio
#npx prisma migrate dev


---------------------------

const express = require("express");

const createUser = express.Router();

const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function createUserPJ(endereco_usuario, telefone_usuario, nome_usuario, email_usuario, cidade_usuario, cnpj, senha) {
    try{ 

        // if(campos.some(item => item === "")){
        //     return({mensagem: "Preencha todos os campos"});
        // }else if(!!checagemUser){
        //     return({mensagem: "Usuário já cadastrado"});
        // }else{
            const userPJ = await prisma.tbusuario_pj.create({
                data:{
                    cnpj :  cnpj
                },
            });

            const user = await prisma.tbusuario.create({ // fazendo um insert no banco de dados com os dados que precisamos
                data:{
                    endereco_usuario : endereco_usuario,
                    senha: senha,
                    telefone_usuario : telefone_usuario,
                    nome_usuario : nome_usuario, 
                    email_usuario : email_usuario,
                    cidade_usuario: cidade_usuario,
                    id_usuario_pj : cnpj
                },
            });

            return user;
        // }
    }catch(error){ console.error(error) }
}

async function createUserPF(endereco_usuario, telefone_usuario, nome_usuario, email_usuario, cidade_usuario, cpf, senha){
    try{
        // if(campos.some(item => item === "")){
        //     return({mensagem: "Preencha todos os campos"});
        // }else if(!!checagemUser){
        //     return({mensagem: "Usuário já cadastrado"});
        // }else{
            const userPF = await prisma.tbusuario_pf.create({
                data:{
                    cpf :  cpf
                },
            });

            const user = await prisma.tbusuario.create({
                data:{
                    endereco_usuario : endereco_usuario ,
                    senha : senha ,
                    telefone_usuario : telefone_usuario,
                    nome_usuario : nome_usuario,
                    email_usuario : email_usuario,
                    cidade_usuario: cidade_usuario,
                    id_usuario_pf :  cpf
                },
            });

            
            return user;
        }catch(error){ console.error(error) }
    }

/*
    Create route for user table
*/
createUser.post("/createUser", async (request, response) => {

    if('cnpj' in request.body){ // Cadastro de Pessoa Jurídica
        const {endereco_usuario, telefone_usuario, nome_usuario, email_usuario, cidade_usuario, cnpj, senha} = request.body; 
        
        const user = createUserPJ(endereco_usuario, telefone_usuario, nome_usuario, email_usuario, cidade_usuario, cnpj, senha)
            .then( (user) => {
                return response.status(201).json(user)
            })
    }
    
    else{ // cadastro de Pessoa Física
        const {endereco_usuario, telefone_usuario, nome_usuario, email_usuario, cidade_usuario, cpf, senha} = request.body; 

        const user = createUserPF(endereco_usuario, telefone_usuario, nome_usuario, email_usuario, cidade_usuario, cpf, senha)
            .then((user) => {
                return response.status(201).json(user)
            });
    }
});

module.exports = createUser;