-- CreateEnum
CREATE TYPE "sexo_enum" AS ENUM ('M', 'F');

-- CreateTable
CREATE TABLE "tbadministrador" (
    "id_administrador" SERIAL NOT NULL,

    CONSTRAINT "tbadministrador_pkey" PRIMARY KEY ("id_administrador")
);

-- CreateTable
CREATE TABLE "tbanunciante" (
    "id_anunciante" SERIAL NOT NULL,
    "telefone_anunciante" BIGINT,
    "nome_anunciante" VARCHAR(255),
    "id_usuario" INTEGER,

    CONSTRAINT "tbanunciante_pkey" PRIMARY KEY ("id_anunciante")
);

-- CreateTable
CREATE TABLE "tbanuncio" (
    "id_anuncio" SERIAL NOT NULL,
    "id_anunciante" INTEGER,
    "tipo_anuncio" VARCHAR(100),

    CONSTRAINT "tbanuncio_pkey" PRIMARY KEY ("id_anuncio")
);

-- CreateTable
CREATE TABLE "tbhemocentro" (
    "id_hemocentro" SERIAL NOT NULL,
    "nome_hemocentro" VARCHAR(255),
    "telefone_hemocentro" BIGINT,
    "endereco_hemocentro" VARCHAR(150),
    "id_administrador" INTEGER,

    CONSTRAINT "tbhemocentro_pkey" PRIMARY KEY ("id_hemocentro")
);

-- CreateTable
CREATE TABLE "tbpontos" (
    "id_pontuacao" SERIAL NOT NULL,
    "n_pontos" INTEGER,
    "id_doacao" INTEGER,

    CONSTRAINT "tbpontos_pkey" PRIMARY KEY ("id_pontuacao")
);

-- CreateTable
CREATE TABLE "tbpublicacao" (
    "id_publicacao" SERIAL NOT NULL,
    "id_usuario" INTEGER,
    "data_hora" TIMESTAMP(6),

    CONSTRAINT "tbpublicacao_pkey" PRIMARY KEY ("id_publicacao")
);

-- CreateTable
CREATE TABLE "tbregis_doacao" (
    "id_doacao" SERIAL NOT NULL,
    "data_doacao" DATE,
    "id_usuario" INTEGER,
    "comprovante_doacao" BIGINT NOT NULL,

    CONSTRAINT "tbregis_doacao_pkey" PRIMARY KEY ("id_doacao")
);

-- CreateTable
CREATE TABLE "tbsuporte" (
    "n_protocolo" SERIAL NOT NULL,
    "id_usuario" INTEGER,
    "id_administrador" INTEGER,

    CONSTRAINT "tbsuporte_pkey" PRIMARY KEY ("n_protocolo")
);

-- CreateTable
CREATE TABLE "tbusuario" (
    "id_usuario" SERIAL NOT NULL,
    "endereco_usuario" VARCHAR(150),
    "telefone_usuario" BIGINT,
    "nome_usuario" VARCHAR(255),
    "cidade_usuario" VARCHAR(50),
    "email_usuario" VARCHAR(100),
    "id_administrador" INTEGER,
    "id_usuario_pf" BIGINT,
    "id_usuario_pj" BIGINT,

    CONSTRAINT "tbusuario_pkey" PRIMARY KEY ("id_usuario")
);

-- CreateTable
CREATE TABLE "tbusuario_pf" (
    "cpf" BIGINT NOT NULL,
    "data_nasc" DATE,
    "tipo_sanguineo" VARCHAR(5),
    "sexo" "sexo_enum",

    CONSTRAINT "tbusuario_pf_pkey" PRIMARY KEY ("cpf")
);

-- CreateTable
CREATE TABLE "tbusuario_pj" (
    "cnpj" BIGINT NOT NULL,

    CONSTRAINT "tbusuario_pj_pkey" PRIMARY KEY ("cnpj")
);

-- CreateIndex
CREATE UNIQUE INDEX "tbregis_doacao_comprovante_doacao_key" ON "tbregis_doacao"("comprovante_doacao");

-- AddForeignKey
ALTER TABLE "tbanunciante" ADD CONSTRAINT "fk_id_usuario_anunciante" FOREIGN KEY ("id_usuario") REFERENCES "tbusuario"("id_usuario") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tbanuncio" ADD CONSTRAINT "fk_id_anunciante" FOREIGN KEY ("id_anunciante") REFERENCES "tbanunciante"("id_anunciante") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tbhemocentro" ADD CONSTRAINT "fk_id_administrador_hemocentro" FOREIGN KEY ("id_administrador") REFERENCES "tbadministrador"("id_administrador") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tbpontos" ADD CONSTRAINT "fk_id_doacao_pontos" FOREIGN KEY ("id_doacao") REFERENCES "tbregis_doacao"("id_doacao") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tbpublicacao" ADD CONSTRAINT "fk_id_usuario_publicacao" FOREIGN KEY ("id_usuario") REFERENCES "tbusuario"("id_usuario") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tbregis_doacao" ADD CONSTRAINT "fk_id_usuario_regisdoacao" FOREIGN KEY ("id_usuario") REFERENCES "tbusuario"("id_usuario") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tbsuporte" ADD CONSTRAINT "fk_id_administrador_suporte" FOREIGN KEY ("id_administrador") REFERENCES "tbadministrador"("id_administrador") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tbsuporte" ADD CONSTRAINT "fk_id_usuario_suporte" FOREIGN KEY ("id_usuario") REFERENCES "tbusuario"("id_usuario") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tbusuario" ADD CONSTRAINT "fk_id_administrador_usuario" FOREIGN KEY ("id_administrador") REFERENCES "tbadministrador"("id_administrador") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tbusuario" ADD CONSTRAINT "fk_id_usuario_pf" FOREIGN KEY ("id_usuario_pf") REFERENCES "tbusuario_pf"("cpf") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tbusuario" ADD CONSTRAINT "fk_id_usuario_pj" FOREIGN KEY ("id_usuario_pj") REFERENCES "tbusuario_pj"("cnpj") ON DELETE NO ACTION ON UPDATE NO ACTION;
